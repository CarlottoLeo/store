# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(
  [
    [name: "Banana", value: "5.00"],
    [name: "Maça", value: "6.00"],
    [name: "Cebola", value: "4.00"],
    [name: "Tomate", value: "10.00"],
  ]
)

User.create(
  [
    [email: 'user@user.com', password: '123456'],
    [email: 'pedidos@user.com', password: '123456'],
  ]
)
