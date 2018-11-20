class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(set_comments)
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(set_comment)
    @comment.user_id = current_user.id
    if @comment.save 
     redirect_to @post
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def set_comment
    params.require(:comment).permit( :title, :body)
  end
end
