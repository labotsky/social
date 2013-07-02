# encoding: utf-8

class ImagepostUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick 
  storage :file
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
 
  version :upload do
    process resize_to_limit: [800, 500]
  end


  version :gallery do
    process resize_to_limit: [200, 200]
  end

  version :right do
    process resize_to_limit: [100, 100]
  end

  version :small do
    process resize_to_fill: [50, 50]
  end
 
   def extension_white_list
     %w(jpg jpeg png)
   end

end
