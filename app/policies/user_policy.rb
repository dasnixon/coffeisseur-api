class RoastPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.none
      end
    end
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? || (user == record)
  end

  def create?
    user.admin?
  end

  def permitted_attributes
    %i(
      first_name
      last_name
      email
      roaster
      about
      username
      favorite_roaster
      password
      password_confirmation
    )
  end
end
