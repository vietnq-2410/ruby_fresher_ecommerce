class Ability
  include CanCan::Ability

  def initialize user
    can :read, Comment
    can :read, Product

    return if user.blank?

    if user.user?
      can :manage, User, id: user.id
      can %i(index create), Order
      can :manage, Rate, user_id: user.id
      can %i(create update destroy), Comment, user_id: user.id
      cannot :manage, Admin::AdminsController
    elsif user.admin?
      can :manage, :all
    end
  end
end
