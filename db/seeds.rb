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
p "Delete all the things"

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
