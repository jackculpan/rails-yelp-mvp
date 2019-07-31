# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

# TODO: Write a seed to insert 100 posts in the database


10.times do
  Restaurant.create(
  name: Faker::Company.name,
  address: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.phone_number,
  category: ["chinese", "italian", "japanese", "french", "belgian"].sample
)
end

@restaurants = Restaurant.all

50.times do
  Review.create(
  content: Faker::Restaurant.review,
  rating: [0, 1, 2, 3, 4, 5].sample,
  restaurant_id: @restaurants.sample.id
)
end
