class Comment < ActiveRecord::Base
  belongs_to :post
  has_many :likes, dependent: :destroy
  attr_accessible :body, :commenter, :created_at, :user_id, :comment_id

  validates_presence_of :body
  validates :body, :length => { :minimum => 2 }
  validates :body, :length => { :maximum => 200 }
end


