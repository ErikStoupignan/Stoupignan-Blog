class CommentsController < ApplicationController
  def new
    current_user
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(current_user, @comment.post)
    else
      render :create
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(post.author_id)
    @comment = Comment.find(params[:id])
    @comment.destroy
    post.destroy
    user.posts_counter -= 1
    user.save
    redirect_to user_url(user)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
