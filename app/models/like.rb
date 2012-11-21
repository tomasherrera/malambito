class Like < ActiveRecord::Base
   belongs_to :comment
   belongs_to :user
   attr_accessible :comment_id, :user_id
end
