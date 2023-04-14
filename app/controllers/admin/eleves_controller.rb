class Admin::ElevesController < ApplicationController
  before_action :set_eleve, only: %i[ show edit update destroy]
  before_action :check_if_admin

  def index 
    @eleves = Eleve.all
  end

  # GET /eleves/new
  def new
    @eleve = Eleve.new
  end

  def search
    @query = params[:query]
    return false if @query.empty?
    @eleves = Eleve.where("eleves.nom_complet LIKE ?", ["%#{@query}%"])
    render "index"
  end


  def show
    @eleve = Eleve.find(params[:id])
  end

  # POST /eleves or /eleves.json
  def create
    @eleve = Eleve.new(eleve_params)

    respond_to do |format|
      if @eleve.save
        format.html { redirect_to admin_elefe_path(@eleve), notice: "eleve cree avec succes" }
        format.json { render :show, status: :created, location: @eleve }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @eleve.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eleves/1 or /eleves/1.json
  def update
    respond_to do |format|
      if @eleve.update(eleve_params)
        format.html { redirect_to admin_elefe_path(@eleve), notice: "Enseignant modifie avec success." }
        format.json { render :show, status: :ok, location: @eleve }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @eleve.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eleves/1 or /eleves/1.json
  def destroy
    @eleve.destroy

    respond_to do |format|
      format.html { redirect_to admin_teachers_path, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

 
  private

  def check_if_admin
    # puts "current_user: #{current_user.inspect}"
    redirect_to root_path unless current_user.is_admin?
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_eleve
      @eleve = Eleve.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def eleve_params
      params.require(:eleve).permit(:nom_complet, :addresse, :tel_du_parent, :niveau_etude, :classe, :parent_id)
    end
end