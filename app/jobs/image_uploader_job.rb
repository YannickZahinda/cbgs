class ImageUploaderJob
    include Sidekiq::Job
  
    def perform(gallery_id)
      gallery = Gallery.find(gallery_id)
      Cloudinary::Uploader.upload(gallery.image.path)
    end
  end
