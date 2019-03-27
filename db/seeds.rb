# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating customers"

c1 = Customer.create!(
  name: "Il Tucano",
  address: "Piazza La Bomba e Scappa, 2 Peveragno"
)

c2 = Customer.create!(
  name: "Bove's",
  address: "Via ciaone, 3 Cuneo"
)

puts "Created customers"

puts "Creating products"

p1 = Product.create!(
  name: 'tovagliolo 15x15',
  size: 200
)

p2 = Product.create!(
  name: 'tovaglia 2x3',
  size: 400
)

puts "Created products"

puts "Creating users"

u1 = User.create!(
  full_name: 'Luca Giuliano',
  email: 'luca@topclean.it',
  password: 'changeme'
)

u2 = User.create!(
  full_name: 'Ivan Giuliano',
  email: 'ivan@topclean.it',
  password: 'changeme'
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

puts "Creating example ddts"

ddt_1 = Ddt.create!(
  user: u1,
  customer: c1
)

ddt_2 = Ddt.create!(
  user: u2,
  customer: c2
)

puts "Finished creating ddts"

puts "Adding products to ddts"

ddt1_p1 = DdtProduct.create!(
  ddt: ddt_1,
  product: p1,
  quantity: 100
)

ddt1_p2 = DdtProduct.create!(
  ddt: ddt_1,
  product: p2,
  quantity: 400
)

ddt2_p1 = DdtProduct.create!(
  ddt: ddt_2,
  product: p1,
  quantity: 10
)

ddt2_p2 = DdtProduct.create!(
  ddt: ddt_2,
  product: p2,
  quantity: 8
)

puts "Finished adding products to ddts"