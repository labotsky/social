class Imagepost < ActiveRecord::Base
  attr_accessible :image, :remember_token, :imagepostable_id, :imagepostable_type
  belongs_to :micropost
  belongs_to :imagepostable, polymorphic: true
  mount_uploader :image, ImagepostUploader
end
