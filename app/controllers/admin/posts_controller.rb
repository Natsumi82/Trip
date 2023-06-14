class Admin::PostsController < ApplicationController
   before_action :authenticate_admin!
  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def show
     @post = Post.find(params[:id])
  end

  def edit
    @Post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
     if @post.update(item_params)
       flash[:notice] = "投稿の変更が完了しました。"
       redirect_to admin_post_path(@post)
     else
       flash[:alert] = "投稿の変更内容に不備があります。"
       render :edit
     end
  end


  private
  def post_params
    params.require(:post).permit(:post_name,:caption)
  end
end
