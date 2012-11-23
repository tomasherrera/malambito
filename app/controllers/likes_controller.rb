class LikesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @user = current_user
    @like = Like.new()
    @like.comment = @comment
    @like.user = @user
    @like.save()
  end

  def destroy
    like = Like.find(params[:id]).destroy
    @comment = like.comment
    redirect_to post_path(@post)
  end
end