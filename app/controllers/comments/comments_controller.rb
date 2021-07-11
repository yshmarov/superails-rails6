class Comments::CommentsController < CommentsController
  before_action :set_commentable

  def new
    @comment = current_user.comments.new(commentable: @commentable)
  end

  private

  def set_commentable
    @commentable = Comment.find(params[:comment_id])
  end
end