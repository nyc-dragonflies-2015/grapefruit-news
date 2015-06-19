class Post < ActiveRecord::Base
  has_many :comments
  has_many :post_votes
  belongs_to :user
  validates :title, presence: true
end
