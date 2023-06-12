class Public::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def show
     @post = Post.new(post_params)
  end

  def edit
  end

  def destroy
    post = Post.new(post_params)
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:post_name, :caption)
  end
end
