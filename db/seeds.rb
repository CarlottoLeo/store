# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'cpf_cnpj'


User.create(
  [
    [email: 'user@user.com', password: '123456'],
    [email: 'pedidos@user.com', password: '123456'],
  ]
)

for i in 1..12 do
  Product.create({name: Faker::Commerce.product_name, value: rand(14) + 1})
end

for i in 1..8 do
  Person.create({name: Faker::Name.name, cpf: CPF.generate})
end

for i in 1..10 do
  Order.create do |order|
    order.name = "Order ##{order.id}"
    order.person = Person.find_by_id(rand(7) + 1)
    order.total_value = 0

    for pid in 1..rand(11) + 1 do
      prod = Product.find_by_id(pid)

      unless (prod.nil?)
        item = Item.create({
          prodid: prod.id,
          amount: rand(499) + 1,
          value:  prod.value
        })

        pos = order.items.find_index { |index| index.prodid == item.prodid }

        if pos.nil?
          order.items.push item
        else
          order.items[pos][:amount] += item.amount
          order.items[pos][:total]   = order.items[pos][:amount] * item.value
        end

        order.total_value += item.total
      end
    end

    order.save
  end
end
