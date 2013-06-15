# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base  
  include CarrierWave::RMagick 
  storage :file
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
 
  def default_url  
     "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end 

  version :register do
    process resize_to_fill: [100, 100]
  end

  version :top do
    process resize_to_fill: [22, 22]
  end

  version :profile do
    process resize_to_fill: [50, 50]
  end


  version :gallery do
    process resize_to_limit: [500, 500]
  end
 
   def extension_white_list
     %w(jpg jpeg png)
   end
end
