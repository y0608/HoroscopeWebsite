class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    return unless user.present?

    can :manage, :all if user.role == "admin"
    
    can [:create, :update, :destroy], Comment, user_id: user.id
    can :show, User, id: user.id

    return unless user.horoscopist?
    can [:create, :update, :destroy], Post, horoscopist_id: user.id
  end
end
