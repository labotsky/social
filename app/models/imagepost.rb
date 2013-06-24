class Imagepost < ActiveRecord::Base
  attr_accessible :image, :remember_token
  belongs_to :micropost
  mount_uploader :image, ImagepostUploader
end
