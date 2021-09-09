class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_post, only: %i[ show edit update destroy upvote downvote bookmark watchlist complete ]

  def index
    # @posts = Post.all.order(created_at: :desc)
    @q = Post.order(created_at: :desc).ransack(params[:q])
    @pagy, @posts = pagy(@q.result.includes(:user))

    # if current_user&.active?
    #   @posts = Post.all
    # else
    #   @posts = Post.free
    # end
  end

  def upvote
    if current_user.voted_up_on? @post, vote_scope: 'like'
      @post.unvote_by current_user, vote_scope: 'like'
    else
      @post.upvote_by current_user, vote_scope: 'like'
    end
    render "vote.js.erb"
  end

  def downvote
    if current_user.voted_down_on? @post, vote_scope: 'like'
      @post.unvote_by current_user, vote_scope: 'like'
    else
      @post.downvote_by current_user, vote_scope: 'like'
    end
    render "vote.js.erb"
  end

  def bookmark
    # upvote
    if current_user.voted_up_on? @post, vote_scope: 'bookmark'
      @post.unvote_by current_user, vote_scope: 'bookmark'
    else
      @post.upvote_by current_user, vote_scope: 'bookmark'
    end
    render "vote.js.erb"
  end

  def complete
    # upvote
    if current_user.voted_up_on? @post, vote_scope: 'watchlist'
      @post.unvote_by current_user, vote_scope: 'watchlist'
    else
      @post.upvote_by current_user, vote_scope: 'watchlist'
    end
    render "vote.js.erb"
  end

  def watchlist
    # downvote
    if current_user.voted_down_on? @post, vote_scope: 'watchlist'
      @post.unvote_by current_user, vote_scope: 'watchlist'
    else
      @post.downvote_by current_user, vote_scope: 'watchlist'
    end
    render "vote.js.erb"
  end

  def show
    set_meta_tags title: @post.title,
                  description: @post.description,
                  keywords: 'Site, Login, Members'

    if @post.premium? && current_user&.subscription_status != 'active'
      redirect_to posts_path, alert: 'You are not a premium subscriber'
    end

    @commentable = @post
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    set_meta_tags title: "#{action_name.capitalize} #{controller_name.singularize.capitalize}"
    @post = Post.new
  end

  def edit
    set_meta_tags title: "#{action_name.capitalize} #{controller_name.singularize.capitalize}"
    unless @post.user == current_user
      redirect_to posts_path, alert: 'You are not authorized'
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    unless @post.user == current_user
      redirect_to posts_path, alert: 'You are not authorized'
    else
      if @post.update(post_params)
        redirect_to @post, notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    unless @post.user == current_user
      redirect_to posts_path, alert: 'You are not authorized'
    else
      @post.destroy
      redirect_to posts_url, notice: "Post was successfully destroyed."
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])

      # post_path is only for SHOW action
      # if request.path != post_path(@post)
      #   return redirect_to @post, :status => :moved_permanently
      # end
    end

    def post_params
      params.require(:post).permit(:title, :body, :premium, :description, tag_ids: [])
    end
end
