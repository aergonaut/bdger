class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.persisted?
      if user.admin?
        can :manage, :all
      else
        can :read, :all

        can :create, Achievement
        can [:update, :destroy], Achievement, user_id: user.id

        can :update, User, id: user.id
      end
    else
      can :read, :all
    end
  end
end
