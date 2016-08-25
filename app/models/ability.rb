class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.rule == 1
      can :manage, :all
      can :rules, User
      can :profile, User
    end
  end
end
