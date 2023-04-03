class ElevesController < ApplicationController
  before_action :set_elefe, only: %i[ show edit update destroy ]

  # GET /eleves or /eleves.json
  def index
    @eleves = Eleve.all
  end

  # GET /eleves/1 or /eleves/1.json
  def show
  end

  # GET /eleves/new
  def new
    @elefe = Eleve.new
  end

  # GET /eleves/1/edit
  def edit
  end

  # POST /eleves or /eleves.json
  def create
    @elefe = Eleve.new(elefe_params)

    respond_to do |format|
      if @elefe.save
        format.html { redirect_to elefe_url(@elefe), notice: "Eleve was successfully created." }
        format.json { render :show, status: :created, location: @elefe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @elefe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eleves/1 or /eleves/1.json
  def update
    respond_to do |format|
      if @elefe.update(elefe_params)
        format.html { redirect_to elefe_url(@elefe), notice: "Eleve was successfully updated." }
        format.json { render :show, status: :ok, location: @elefe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @elefe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eleves/1 or /eleves/1.json
  def destroy
    @elefe.destroy

    respond_to do |format|
      format.html { redirect_to eleves_url, notice: "Eleve was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elefe
      @elefe = Eleve.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def elefe_params
      params.fetch(:elefe, {})
    end
end
