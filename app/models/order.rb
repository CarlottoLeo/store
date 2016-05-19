class Order < ActiveRecord::Base
  has_many :items
  belongs_to :user

  scope :filter_by_user, ->(id) {where('user_id == ?', id)}

  audited

  acts_as_paranoid
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  def self.new_with_products(user, order_params)
    Order.create do |order|
      order.user = user
      order.name = "Order #{order.id}"
      order.total_value = 0

      if order_params[:items_attributes]
        order_params[:items_attributes].each do |_, product|
          prod = Product.find_by_id(product[:id].to_i)

          unless (prod.nil?)
            item = Item.new({
              prodid: prod.id,
              amount: product[:amount],
              value:  prod.value,
              total:  prod.value * product[:amount].to_i
            })

            p item

            order.items.push(item)
            order.total_value += item.total
          end
        end
      else
        return nil
      end

      return order
    end
  end
end
