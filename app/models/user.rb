class User < ActiveRecord::Base
  has_secure_password
  has_many :post_votes
  has_many :comment_votes
  has_many :comments
  has_many :posts
  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true, presence: true
end
