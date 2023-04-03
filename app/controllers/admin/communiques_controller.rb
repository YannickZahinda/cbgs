class Admin::CommuniquesController < ApplicationController
  def index 
    @communiques = Communique.all
  end
end