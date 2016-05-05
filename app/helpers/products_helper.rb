module ProductsHelper
  def add_to_cart(product)
    @order ||= Order.new
    @order.products << product
  end
end
