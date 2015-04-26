class RoastPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def permitted_attributes
    %i(
      degree_of_roast
      description
      roasted_with
      time
      first_crack_at
      second_crack_at
      favorite
      bean_id
    )
  end
end
