class Posts::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Post.friendly.find(params[:post_id])
  end
end