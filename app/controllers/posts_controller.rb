class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
 def index
  @posts = Post.all.order('created_at DESC')
  end

  def show
   
  end

  def new
    # @post = Post.new
    @post = current_user.posts.build
  end

  def create 
    # @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    @post.user == current_user
    if @post.save
      redirect_to post_url(@post)
    else 
      render :new
    end
  end
  def edit
  end

  def update
      if @post.update(post_params)
      redirect_to post_url(@post)
      else 
      render :edit
    end
  end

  def destroy
    @post.destroy
     redirect_to root_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
