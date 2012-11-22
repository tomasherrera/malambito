class Post < ActiveRecord::Base
  attr_accessible :content, :title, :created_at, :user_id
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
 
  has_many :comments
  has_many :user_comments
  has_many :anonymous_comments
  belongs_to :user
end
