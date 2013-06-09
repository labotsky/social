class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  default_scope order: 'microposts.created_at DESC'
  make_flaggable :like
end