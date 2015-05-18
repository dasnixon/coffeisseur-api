class BeanPolicy < ApplicationPolicy
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
      name
      description
      characteristics
      degree_of_roast
      farm
      varietal
      processing
      grade
      appearance
      country
      region
      organic
      espresso
    )
  end
end
