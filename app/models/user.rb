class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable

  extend FriendlyId
  friendly_id :username, use: :slugged
  has_many :posts

  has_many :followings
  has_many :followers, through: :followings

  validates_uniqueness_of :username, :slug
  validates_presence_of :full_name, :username, :slug
end
