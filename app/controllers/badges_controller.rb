class BadgesController < ApplicationController
  def index
    @badges = Badge.find :all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new params[:badge]
    if @badge.save
      flash[:success] = "Badge saved."
      redirect_to badges_path
    else
      render 'new'
    end
  end
end
