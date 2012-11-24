class LikesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @user = current_user
    @like = Like.new()
    @like.comment = @comment
    @like.user = @user
    @like.save()
    respond_to do |format|
      format.html {  }# index.html.erb
      format.js {render :replace}
      end
  end

  def destroy
    @like = Like.find(params[:id]).destroy
    @comment = @like.comment
    respond_to do |format|
      format.js {render :replace}
    end    
  end
end