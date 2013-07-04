class Comment < ActiveRecord::Base
  attr_accessible :content, :micropost_id
  belongs_to :micropost
  belongs_to :user
  has_many :imageposts, as: :imagepostable, dependent: :destroy
  validates :content, presence: true
  make_flaggable :like
end
