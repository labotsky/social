class Micropost < ActiveRecord::Base
  attr_accessible :content, :user_id, :image, :post_user_id
  belongs_to :user
  has_many :imageposts, as: :imagepostable, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :content, presence: true
  validates :post_user_id, presence: true
  default_scope order: 'microposts.created_at DESC'
  make_flaggable :like
end
