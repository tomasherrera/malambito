class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :destroy, :update, :edit]
  before_filter :authenticate_auth, :only => [:destroy, :update, :edit]

  def authenticate_auth
    @post = Post.find(params[:id])
    if current_user == @post.user 
        true
    else
      redirect_to post_path(@post), alert: 'You cannot modify this post since you are not the creator of it!'
    end
  end
	def index
		@posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    	end
  	end
  	def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    	end
  	end
  	def edit
    @post = Post.find(params[:id])
  	end
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, post: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, post: :unprocessable_entity }
      end
    end
  end
   def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
  def destroy
  @post = Post.find(params[:id])
  @post.destroy
 
  respond_to do |format|
    format.html { redirect_to posts_url }
    format.json { head :no_content }
  end

end
def update
  
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, post: :unprocessable_entity }
      end
    end
 
end
end
