class Comment < ActiveRecord::Base
  attr_accessible :content, :micropost_id, :post_user_id
  belongs_to :micropost
  belongs_to :user
  has_many :imageposts, as: :imagepostable, dependent: :destroy
  validates :content, presence: true
  validates :micropost_id, presence: true
  validates :post_user_id, presence: true
  make_flaggable :like
end
