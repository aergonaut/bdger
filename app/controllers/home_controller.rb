class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to badges_path
    else
      render 'index', layout: 'root'
    end
  end

  def privacy
  end

  def terms
  end

  def help
  end

  def contact
  end
end
