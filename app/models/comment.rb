class Comment < ActiveRecord::Base
  has_many :comment_votes
  belongs_to :post
  belongs_to :user
end
