class Comment < ActiveRecord::Base
  belongs_to :post
  has_many :likes
  attr_accessible :body, :commenter, :created_at
end
