class CommentsController < ApplicationController
  before_action :set_commentable
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: 'Comment created'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to @commentable, notice: 'Comment deleted'
    else
      redirect_to @commentable, alert: 'Something went wrong'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_commentable
    @commentable = Post.find(params[:post_id])
  end
end