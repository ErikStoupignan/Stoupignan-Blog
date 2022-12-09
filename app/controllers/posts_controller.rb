class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @userposts = @post.comments.includes(:author, :post)
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

  def destroy
    post = Post.find(params[:id])
    user = User.find(post.author_id)
    post.destroy
    user.posts_counter -= 1
    user.save
    redirect_to user_url(user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
