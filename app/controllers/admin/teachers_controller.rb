class Admin::TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]
  before_action :check_if_admin

  def index 
    @teachers = Teacher.all
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # Search

  def search
    @query = params[:name]

    # return false if @query.empty?
    return false if @query.nil? || @query.empty?

    @teachers = Teacher.where("teachers.nom_complet LIKE ?", ["%#{@query}%"])
    render "index"
  end

  # POST /teachers or /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to admin_teacher_path(@teacher), notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to admin_teacher_path(@teacher), notice: "Enseignant modifie avec success." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    @teacher.destroy

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
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:nom_complet, :addresse, :niveau_etude, :classe_enseignee, :phone, :email)
    end
end