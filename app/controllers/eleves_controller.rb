class ElevesController < ApplicationController

  # GET /eleves or /eleves.json
  def index
    @eleves = Eleve.all
  end

  # GET /eleves/1 or /eleves/1.json
  def show
  end
end
