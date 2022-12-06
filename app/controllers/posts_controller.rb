class PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @userposts = @post.comments.includes(:author)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
