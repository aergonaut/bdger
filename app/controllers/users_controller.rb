class UsersController < ApplicationController
  def show
    @user = User.find params[:username]
  end

  def profile
    if user_signed_in?
      redirect_to user_path(current_user)
    else
      redirect_to root
    end
  end
end
