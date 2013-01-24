class AchievementsController < ApplicationController
  def new
    @badge = Badge.find params[:badge_id]
    @achievement = current_user.achievements.build
  end
end
