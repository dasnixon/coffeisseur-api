class RoasterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def permitted_attributes
    %i(
      name
      founded
      description
      site
      email
      phone
      phone_country_code
    )
  end
end
