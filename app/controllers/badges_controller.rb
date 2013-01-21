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
      flash[:success] = "Badge saved"
      redirect_to badges_path
    else
      render 'new'
    end
  end

  def show
    @badge = Badge.find params[:id]
  end

  def edit
    @badge = Badge.find params[:id]
  end

  def update
    @badge = Badge.find params[:id]
    if @badge.update_attributes params[:badge]
      flash[:success] = "Badge updated"
      redirect_to edit_badge_path(@badge)
    else
      render 'edit'
    end
  end

  def destroy
    @badge = Badge.find params[:id]
    @badge.destroy
    if @badge.destroyed?
      flash[:success] = "Badge deleted"
      redirect_to badges_path
    else
      flash[:error] = "There was a problem deleting this record"
      redirect_to edit_badge_path(@badge)
    end
  end
end
