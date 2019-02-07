# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
#Create 10 cities
10.times do 
  City.create(name: Faker::Nation.capital_city)
end
puts "sayé"
#Create 10 users
10.times do
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(3), email: "email@email.com", age: rand(18..40))
  city = City.all.sample
  user.city = city
  user.save
end
puts "sayé"
#Create 20 gossips
20.times do
  gossip = Gossip.new(title: Faker::GreekPhilosophers.name, content: Faker::Lorem.sentence(3))
  user = User.all.sample
  gossip.user = user
  gossip.save
end
puts "sayé"
#Create 10 tags
10.times do
  tag = Tag.create(title: "##{Faker::Pokemon.name}")
end
puts "sayé"
#Join 20 gossips-tags
20.times do
  join = JoinTableGossipsTag.new
  gossip = Gossip.all.sample
  join.gossip = gossip
  tag = Tag.all.sample
  join.tag = tag
  join.save
end
puts "sayé"
#Create 10 PM
10.times do
  pm = PrivateMessage.new(content: Faker::Lorem.sentence(3))
  user = User.all.sample
  pm.recipient = user
  user = User.all.sample
  pm.sender = user
  pm.save
end
puts "sayé"