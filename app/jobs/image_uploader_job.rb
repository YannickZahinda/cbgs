class ImageUploaderJob
    include Sidekiq::Job
  
    def perform(gallery_id)
      gallery = Gallery.find(gallery_id)
      # Perform the upload to Cloudinary
      Cloudinary::Uploader.upload(gallery.image.path)
    end
  end
  