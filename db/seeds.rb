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
  { city: "London", state: "-", region: "England", lat: 51.507351, long: -0.127758 },
  { city: "Gibraltar", state: "-", region: "UK", lat: 36.140751, long: -5.353585 },
  { city: "Surt", state: "-", region: "Libya", lat: 31.189689, long: 16.570193 },
  { city: "Marawi City", state: "-", region: "Philipines", lat: 7.9986, long: 124.2928 },
  { city: "Mosul", state: "-", region: "Iraq", lat: 36.356648, long: 43.164000 },
  { city: "Raqqa", state: "-", region: "Syria", lat: 35.959411, long: 38.998105 },
  { city: "Dabiq", state: "-", region: "Syria", lat: 36.536528, long: 37.270459 }
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
