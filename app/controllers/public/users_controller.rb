class Public::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def unsubscribe
  end

  def withdraw
  end

   def user_params
    params.require(:user).permit(
      :nickname,:nickname_kana,:email,:phone_number)
  end
end
