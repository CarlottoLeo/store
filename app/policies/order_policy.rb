class OrderPolicy < ApplicationPolicy
  def initialize(user, order)
    @user  = user
    @order = order
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
