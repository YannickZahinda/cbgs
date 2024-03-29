class Admin::CommuniquesController < ApplicationController
  before_action :set_communique, only: %i[show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_if_admin

  def index 
    @communiques = Communique.all
  end

  # GET /communiques/1 or /communiques/1.json
  def show
    @communique = Communique.find(params[:id])
  end

  # GET /communiques/new
  def new
    @communique = Communique.new
  end

  # GET /communiques/1/edit
  def edit
  end

  # POST /communiques or /communiques.json
  def create
    @communique = Communique.new(communique_params)

    respond_to do |format|
      if @communique.save
        format.html { redirect_to communique_url(@communique), notice: "Communique ajoute avec success" }
        format.json { render :show, status: :created, location: @communique }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @communique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communiques/1 or /communiques/1.json
  def update
    respond_to do |format|
      if @communique.update(communique_params)
        format.html { redirect_to communique_url(@communique), notice: "Communique was successfully updated." }
        format.json { render :show, status: :ok, location: @communique }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @communique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communiques/1 or /communiques/1.json
  def destroy
    @communique.destroy

    respond_to do |format|
      format.html { redirect_to admin_communiques_path, notice: "Communique efface avec succes." }
      format.json { head :no_content }
    end
  end

  private

    def check_if_admin
      redirect_to root_path unless current_user.is_admin?
    end

    def set_communique
      @communique = Communique.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def communique_params
      params.require(:communique).permit(:titre, :description)
    end

end