# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  surname         :string(255)
#  email           :string(255)
#  country         :string(255)
#  sity            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  date            :date
#  image           :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :country, :date, :email, :name, :sity, :surname, :password, :password_confirmation, :password_digest, :image
  has_secure_password
  before_save { |user| user.email = email.downcase }
  before_create :create_remember_token
  has_many :microposts, dependent: :destroy 
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :followed_users, through: :relationships, source: :followed 
  validates :name, presence: true, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }
  validates :country, presence: true, length: { maximum: 50 }
  validates :date, presence: true
  validates :sity, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create
  mount_uploader :image, ImageUploader
  make_flagger

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end 
end
