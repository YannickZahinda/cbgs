class Admin::ParentsController < ApplicationController
  before_action :set_parent, only: %i[ show edit update destroy ]
  before_action :check_if_admin

  def index 
    @parents = Parent.all
  end

  def show
    # @parent = Parent.find(params[:id])
  end

  def search
    @query = params[:name]

    return false if @query.empty?

    @parents = Parent.where("parents.nom_complet LIKE ?", ["%#{@query}%"])
    render "index"
  end

  # GET /parents/new
  def new
    @parent = Parent.new
  end

  # POST /parents or /parents.json
  def create
    @parent = Parent.new(parent_params)

    respond_to do |format|
      if @parent.save
        format.html { redirect_to admin_parent_path(@parent), notice: "parent cree avec success" }
        format.json { render :show, status: :created, location: @parent }
        # redirect_to admin_parent_path(@parent)
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
        # render :new
      end
    end
  end

  # PATCH/PUT /parents/1 or /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to admin_parent_path(@parent), notice: "parent was successfully updated." }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1 or /parents/1.json
  def destroy
    @parent.destroy

    respond_to do |format|
      format.html { redirect_to admin_parents_path, notice: "parent was successfully destroyed." }
      format.json { head :no_content }
    end

  end

  private

  def check_if_admin
    redirect_to root_path unless current_user.is_admin?
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parent_params
      params.require(:parent).permit(:nom_complet, :addresse, :niveau_etude, :classe_enseignee, :phone, :email)
    end
end