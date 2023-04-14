class HomeController < ApplicationController
  def index
    @communiques = Communique.all
  end
end
