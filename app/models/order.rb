class Order < ActiveRecord::Base
  has_many :items
  belongs_to :user

  scope :filter_by_user, ->(id) {where('user_id == ?', id)}

  audited

  acts_as_paranoid

  def self.new_with_products(user, order_params)
    Order.create do |order|
      order.user = user
      order.name = "Order #{order.id}"
      order.total_value = 0

      if order_params && order_params[:items]
        order_params[:items].each do |_, product|
          prod = Product.find_by_name(product['name'])

          unless (prod.nil?)
            item = Item.new({prodid: prod.id, amount: product['amount'].to_i})

            order.items.push(item)
            order.total_value += prod.value * item.amount
          end
        end
      else
        return nil
      end

      return order
    end
  end
end
