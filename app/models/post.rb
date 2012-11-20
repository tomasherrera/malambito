class Post < ActiveRecord::Base
  attr_accessible :content, :title, :created_at, :user_id
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
 
  has_many :comments
  belongs_to :user
end
