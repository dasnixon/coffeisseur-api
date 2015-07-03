class UserPolicy < ApplicationPolicy
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

  def update?
    user == record
  end

  def create?
    true
  end

  def permitted_attributes
    %i(
      first_name
      last_name
      email
      about
      password
      password_confirmation
    )
  end
end
