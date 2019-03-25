# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating customers"

c1 = Customer.create!(
  name: "cliente1",
  address: "Piazza La Bomba e Scappa, 2"
)

c2 = Customer.create!(
  name: "cliente2",
  address: "Via ciaone, 3"
)

puts "Created customers"

puts "Creating products"

p1 = Product.create!(
  name: 'prodotto1',
  size: 200
)

p2 = Product.create!(
  name: 'prodotto2',
  size: 400
)

puts "Created products"

puts "Creating CustomerProduct"
Customer.all.each do |c|
  Product.all.each do |p|
    CustomerProduct.create!(
      customer: c,
      product: p,
      min_size: Faker::Number.number(2),
      price: Faker::Number.number(2)
    )
  end
end
puts "Created CustomerProduct"