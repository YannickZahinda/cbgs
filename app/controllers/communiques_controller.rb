class CommuniquesController < ApplicationController

  # GET /communiques or /communiques.json
  def index
    @communiques = Communique.all
  end

  # GET /communiques/1 or /communiques/1.json
  def show
    @communique = Communique.find(params[:id])
  end
end
