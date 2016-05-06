class Order < ActiveRecord::Base
  has_many :items
  belongs_to :user

  def self.new_with_products(order_params)
    Order.create do |order|
      order.user_id = order_params[:user_id]
      order.name = "order#{order.id}"
      order.total_value = 0
      order.items = []

      order_params[:products].each do |pid|
        item = Item.new({prodid: pid.to_i})
        prod = Product.find(pid)

        unless item.nil?
          order.items.push(item)
          order.total_value += prod.value
        end
      end

      order.save
    end
  end
end
