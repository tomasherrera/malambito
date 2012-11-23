class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,:registerable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_id,:first_name, :last_name, :provider, :uid, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :posts
  has_many :usercomments
  has_many :likes
  def full_name
    first_name + " " + last_name
  end
  #def has_like? comment
   # likes.find_by_comment_id comment.id
  #end
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  unless user
    user = User.create(first_name:auth.extra.raw_info.first_name,
                         last_name:auth.extra.raw_info.last_name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
  end
  user
end
def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
