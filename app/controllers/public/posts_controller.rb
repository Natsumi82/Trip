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
     @post = Post.find(params[:id])
     @post_comment = PostComment.new
  end

  def edit
   @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, alert: '記事を削除しました！'
  end

  def update
     @post = Post.find(params[:id])
    if @post.update(post_params)
     flash[:notice] = "Post was successfully updated."
     redirect_to posts_path(@post)
    else
     render :edit
    end
  end


  private

  def post_params
    params.require(:post).permit(:post_name,:caption)
  end

 def correct_user
   @post = Post.find(params[:id])
   redirect_to(posts_path) unless @post.user == current_user
 end

end
