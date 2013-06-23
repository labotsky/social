# encoding: utf-8

class ImagepostUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick 
  storage :file
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
 
  version :upload do
    process resize_to_limit: [500, 500]
  end


  version :gallery do
    process resize_to_limit: [300, 300]
  end
 
   def extension_white_list
     %w(jpg jpeg png)
   end

end
