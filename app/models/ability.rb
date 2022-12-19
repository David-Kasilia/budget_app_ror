# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    return unless user.present?
    can :manage, :all if user.role == 'admin'
    can :manage, :all if user.role == 'default'
  end
end
