class CommentsController < ApplicationController
	def create    
    @post = Post.find(params[:post_id])
	    if current_user!=nil
		    @comment = @post.user_comments.new(params[:comment])
		    @comment.user_id = current_user.id
		    if @comment.save
		    	CommentMailer.comment_registration(@post).deliver
		    	respond_to do |format|
      			format.html {redirect_to post_path(@post)}
      			format.js
				end
		    else
		    	redirect_to post_path(@post), :alert => @comment.errors.full_messages.to_sentence
		    end
		else
			@comment = @post.anonymous_comments.create(params[:comment])
			if @comment.save
		    	respond_to do |format|
      			format.html {redirect_to post_path(@post)}
      			format.js
				end
		    else
		    	redirect_to post_path(@post), :alert => @comment.errors.full_messages.to_sentence
		    end
		end
    
  end
end
