class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 def index
  @posts = Post.all.order('created_at DESC')
  end

  def show
   
  end

  def new
    @post = Post.new
  end

  def create 
   @post = Post.new(post_params)
   if @post.save
    redirect_to post_url(@post)
  else 
    render :new
  end

  end

  def update
  end

  def destroy
  end
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
