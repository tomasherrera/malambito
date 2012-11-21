class LikesController < ApplicationController
	def create
    @like = Like.create(params[:like])
    @comment = @like.comment
    render :toggle
  end

  def destroy
    like = Like.find(params[:id]).destroy
    @comment = like.comment
    render :toggle
  end
end