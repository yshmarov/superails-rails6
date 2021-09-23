# frozen_string_literal: true
class CommentsController < ApplicationController
  before_action :set_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.build(comment_params.merge({ user: current_user }))
    if @comment.save
      redirect_to @commentable unless @commentable.is_a?(Comment)
      redirect_to @commentable.find_parent if @commentable.is_a?(Comment)
      flash[:notice] = 'Comment created'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to @commentable unless @commentable.is_a?(Comment)
      redirect_to @commentable.find_parent if @commentable.is_a?(Comment)
      flash[:alert] = 'Comment deleted'
    else
      redirect_to @commentable, alert: 'Something went wrong'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
