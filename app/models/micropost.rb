class Micropost < ActiveRecord::Base
  attr_accessible :content, :user_id, :image
  belongs_to :user
  has_many :imageposts, dependent: :destroy
  validates :user_id, presence: true
  validates :content, presence: true
  default_scope order: 'microposts.created_at DESC'
  make_flaggable :like  
end
