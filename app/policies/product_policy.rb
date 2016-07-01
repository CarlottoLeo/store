class ProductPolicy < ApplicationPolicy
  def initialize(user, product)
    @user    = user
    @product = product
  end

  def index?
    can_manage?
  end

  def create?
    can_manage?
  end

  def destroy?
    can_manage?
  end

  def show?
    can_manage?
  end

  def edit?
    can_manage?
  end

  def update?
    can_manage?
  end

  def search?
    can_manage?
  end

  def can_manage?
    @user && @user.id
  end
end
