
require 'faker'

500.times do
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    material: Faker::Commerce.material,
    category: Faker::Commerce.department,
    color: Faker::Commerce.color
  )
end
