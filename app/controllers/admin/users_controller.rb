class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
     @users = User.all.page(params[:page]).per(10)

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
     @user = USer.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to admin_user_path
    else
      render 'edit'
    end
  end

private
   def user_params
     params.require(:user).permit(
       :nickname,:nickname_kana,:phone_number,:email,:is_deleted)
   end

end
