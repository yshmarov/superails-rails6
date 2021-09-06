module Comments
  class CommentsController < CommentsController

    private

    def set_commentable
      @commentable = Comment.find(params[:comment_id])
    end
  end
end