require "uri"

class UsersController < ApplicationController
  def show
    @user = User.find params[:username]
    @website = unless @user.website.nil? or @user.website.empty?
      uri = URI.parse @user.website
      uri.host
    else
      ""
    end
  end

  def profile
    if user_signed_in?
      redirect_to user_path(current_user)
    else
      redirect_to root
    end
  end

  def edit
  end

  def update
    if current_user.update_attributes params[:user]
      flash[:success] = "Profile updated"
      redirect_to edit_profile_path
    else
      render 'edit'
    end
  end
end
