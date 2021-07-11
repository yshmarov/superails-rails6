class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        # format.html { redirect_to @commentable }
        format.html { redirect_back(fallback_location: root_url) }
        format.js # create.js.erb
      end
    else
      redirect_to @commentable, alert: 'Comment could not be created.'
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy # update(user: nil, content: nil)
    redirect_back(fallback_location: root_url)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end