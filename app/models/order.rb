class Order < ActiveRecord::Base
  has_many :items
  belongs_to :user

  def self.new_with_products(user, order_params)
    Order.create do |order|
      order.user = user
      order.name = "order#{order.id}"
      order.total_value = 0
      order.items = []

      if order_params && order_params[:products] && order_params[:products].size > 0
        order_params[:products].each do |pid|
          item = Item.new({prodid: pid.to_i})
          prod = Product.find(pid)

          unless item.nil?
            order.items.push(item)
            order.total_value += prod.value
          end
        end
      else
        return nil
      end

      return order
    end
  end
end
