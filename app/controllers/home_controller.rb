class HomeController < ApplicationController
  def index
    redirect_to badges_path if user_signed_in?
  end
end
