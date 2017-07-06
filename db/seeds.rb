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

50.times do
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

locations_data = []

50.times do
  locations_data << {
    :city=>FFaker::Address.neighborhood,
    :state=>FFaker::Address.city,
    :region=>FFaker::Address.country,
    :photo => "https://previews.123rf.com/images/hinnamsaisuy/hinnamsaisuy1011/hinnamsaisuy101100055/8190771-garbage-heap-Stock-Photo-garbage-dump.jpg",
    :lat => 37.7749295,
    :long => -122.4194155
  }
end

Location.create(locations_data)
p "Created all the locations"
