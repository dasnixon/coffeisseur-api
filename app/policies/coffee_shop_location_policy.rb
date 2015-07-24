class CoffeeShopLocationPolicy < ApplicationPolicy
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
      phone_number
      phone_country_code
      unit
      building
      street
      city
      region
      country
      address_code
    )
  end
end
