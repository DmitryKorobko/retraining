# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.librarian?
        can :manage, :all
        can :access, :rails_admin       # only allow admin users to access Rails Admin
        can :manage, :dashboard
      else
        can :read, :all
      end
  end
end
