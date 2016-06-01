class ProductPolicy < ApplicationPolicy
  def create?
    return true#user != nil && user.id != nil
  end

  def destroy?
    return true#(create? && user.id == @order.user_id)
  end

  def show?
    return true#destroy?
  end

  def edit?
    return true#destroy?
  end
end
