# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

p "Hello from seeds.rb"

User.destroy_all

p "Deleting all the Users"

users_data = []

5.times do
  users_data << {
    :join_date => Date.today,
    :name=>FFaker::Name.name,
    :current_location=>FFaker::Address.city,
    :profile_pic => "http://longhopes.org/wp-content/uploads/2017/03/Bam-Bam-head.png",
    :email=>FFaker::Internet.email,
    :password_digest => "asdf",
  }
end

User.create(users_data)

p "Created all the Users"

Location.destroy_all

p "Deleting all the locations"

# locations_data = []
#
# 5.times do
#   locations_data << {
#     :city=>FFaker::Address.neighborhood,
#     :state=>FFaker::Address.city,
#     :region=>FFaker::Address.country,
#     :lat => 37.7749295,
#     :long => -122.4194155
#   }
# end

locations_data = [
  { city: "San Francisco", state: "California", region: "United States", lat: 37.47, long: -122.25 },
  { city: "Rio de Janeiro", state: "Rio de Janeiro", region: "Brazil", lat: -22.55, long: -43.12 },
  { city: "Barcelona", state: "Catalonia", region: "Spain", lat: 41.23, long: 2.11 }
]

Location.create(locations_data)
p "Created all the locations"

Post.destroy_all

p "Deleting all the posts"

posts_data = []

50.times do
  posts_data << {
    :title => FFaker::HipsterIpsum.sentence,
    :body => FFaker::HipsterIpsum.paragraph,
    :user_id => rand(User.first.id..User.last.id),
    :location_id => rand(Location.first.id..Location.last.id)
  }
end

Post.create(posts_data)
p "Created all the posts"

# :title => FFaker::HipsterIpsum.sentence,
# :body => FFaker::HipsterIpsum.paragraph
