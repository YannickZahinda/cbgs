class LinksController < ApplicationController

    def index 
      @links = Link.all
    end

    def show
      @link = Link.find(params[:id])
    end

    # def new
    #   @link = Link.new
    # end

    # def create
    #   @link = Link.new(link_params)

    #   if @link.save
    #     redirect_to links_path
    #   else  
    #     render 'new'
    #   end
    # end

    def destroy

    end

    private

    def link_params
      params.require(:link).permit(:url, :description)
    end

end
