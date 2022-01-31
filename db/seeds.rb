# create instances to populate our database

require 'faker'
puts "Cleaning the db..."
Restaurant.destroy_all
puts "... finished destroying restaurants"

puts "Creating restaurants...."
20.times do
  # restaurant = Restaurant.new(
  #   name: Faker::Coffee.blend_name,
  #   city: Faker::Address.city
  # )
  # restaurant.save
  Restaurant.create(
    name: Faker::Coffee.blend_name,
    address: Faker::Address.city
  )
end
puts "...created #{Restaurant.count} restaurants."
