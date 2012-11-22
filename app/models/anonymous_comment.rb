class AnonymousComment < Comment
  validates_presence_of :commenter
  validates :commenter, :length => { :minimum => 2 }
  validates :commenter, :length => { :maximum => 200 }
end
