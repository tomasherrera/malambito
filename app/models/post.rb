class Post < ActiveRecord::Base
  attr_accessible :content, :title, :created_at, :user_id, :picture
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
 
  has_many :comments, dependent: :destroy
  has_many :user_comments
  has_many :anonymous_comments
  has_attached_file :picture, :styles => { :small => "200x200>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  belongs_to :user
end
