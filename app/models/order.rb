class Order < ActiveRecord::Base
  has_many :items, dependent: :destroy
  belongs_to :person

  scope :filter_by_person, ->(id) {where('person_id = ?', id)}

  audited

  validates :person, presence: true
  validates :items,  presence: true

  acts_as_paranoid
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  def self.new_with_products(order_params)
    Order.create do |order|
      order.person = Person.find_by_cpf(order_params[:person])
      order.name = "Order #{order.id}"
      order.total_value = 0

      if order_params[:items_attributes] && order_params[:items_attributes].size > 0
        order_params[:items_attributes].each do |_, product|
          prod = Product.find_by_id(product[:id].to_i)

          unless (prod.nil?)
            item = Item.create({
              prodid: prod.id,
              amount: product[:amount],
              value:  prod.value
            })

            if item.valid?
              pos = order.items.find_index { |i| i.prodid == item.prodid }

              if pos.nil?
                order.items.push(item)
              else
                order.items[pos][:amount] += item.amount
                order.items[pos][:total]  = order.items[pos][:amount] * item.value
              end

              order.total_value += item.total
            end
          end
        end
      end

      return order
    end
  end
end
