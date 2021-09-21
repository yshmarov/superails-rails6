# frozen_string_literal: true

module Posts
  class CommentsController < CommentsController
    private

    def set_commentable
      @commentable = Post.find(params[:post_id])
    end
  end
end
