class CommentMailer < ActionMailer::Base
  default :from => "info@koombeaposts.com"
  
  def comment_registration(post)
    @post = post
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{post.user.full_name} <#{post.user.email}>", 
    	:subject => "Someone has write a comment in one of your post", :from => "info@koombeaposts.com")
  end
end
