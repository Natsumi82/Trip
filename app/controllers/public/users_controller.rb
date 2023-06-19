class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user

  end

  def edit
    @user = current_user
  end

   def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
   end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "Thank you for using!!"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(
      :nickname,:nickname_kana,:email,:phone_number)
  end
end
