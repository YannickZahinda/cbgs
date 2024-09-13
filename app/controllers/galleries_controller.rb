class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end 
  
  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    begin 
      if @gallery.save
        ImageUploaderJob.perform_async(@gallery.id)
        redirect_to galleries_path, notice: 'Image upload is in progress'
      else
        render :new
      end
    rescue Faraday::TimeoutError
      @gallery.errors.add(:base, "Request time out. Please try again later")
      render :new
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:image)
  end
end
  