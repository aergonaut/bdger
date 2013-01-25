class AchievementsController < ApplicationController
  def new
    @badge = Badge.find params[:badge_id]
    @achievement = Achievement.create! user_id: current_user.id, badge_id: @badge.id
    respond_to do |f|
      f.js
    end
  end

  def show
    @achievement = Achievement.find params[:achievement_hash]
  end
end
