class CupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show
    true
  end

  def create?
    user.admin? || user == record.user
  end

  def update?
    user.admin? || user == record.user
  end

  def destroy?
    user.admin? || user == record.user
  end

  def permitted_attributes
    %i(
      name
      description
      brew_process
      rating
      coffee_shop_id
      roast_id
      user_id
    )
  end
end
