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
    [email: 'user@user.com',    password: '123456'],
    [email: 'pedidos@user.com', password: '123456']
  ]
)

for i in 1..500 do
  Product.create(name: Faker::Commerce.product_name, value: rand(14) + 1)
end

for i in 1..100 do
  Person.create(name: Faker::Name.name, cpf: CPF.generate)
end

for i in 1..10 do
  order = Order.new
  order.person = Person.find(rand(99) + 1)

  for j in 1..10 do
    id = rand(499) + 1

    prod = Product.find(id)
    item = Item.new(prodid: prod.id, value: prod.value, amount: 100, total: 100 * prod.value)

    order.items.push item
  end

  order.save
end
