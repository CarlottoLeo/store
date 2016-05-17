class OrderPolicy < ApplicationPolicy
  def initialize(user, order)
    @user  = user
    @order = order
  end

  def create?
    user != nil && user.id != nil
  end

  def destroy?
    (create? && user.id == @order.user_id) || user.is_admin?
  end

  def show?
    destroy?
  end
end
