class OrderPolicy < ApplicationPolicy
  def initialize(user, order)
    @user  = user
    @order = order
  end

  def create?
    return true#user != nil && user.id != nil
  end

  def destroy?
    return true#(create? && user.id == @order.user_id)
  end

  def show?
    return true#destroy?
  end
end
