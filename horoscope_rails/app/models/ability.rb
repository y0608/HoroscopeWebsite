# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :posts
    return unless user.present?

    return unless user.horoscopist?
    can [:create, :update, :destroy], Post, horoscopist_id: user.id
  end
end
