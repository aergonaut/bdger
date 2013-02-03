class AchievementsController < ApplicationController
  def new
    @badge = Badge.find params[:badge_id]
    @achievement = Achievement.new user_id: current_user.id, badge_id: @badge.id
    authorize! current_user, @achievement
    @achievement.save
    respond_to do |f|
      f.js
    end
  end

  def show
    @achievement = Achievement.find params[:achievement_hash]
  end

  def destroy
    @achievement = Achievement.find params[:achievement_hash]
    authorize! current_user, @achievement
    @achievement.destroy
    flash[:success] = "Achievement deleted"
    redirect_to user_path(@achievement.user)
  end
end
