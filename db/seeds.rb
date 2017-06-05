# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'random_data'
require 'faker'
include Faker

# Creates Users
5.times do 
    User.create!(
        # name:       Faker::Name.name,
        email:      Faker::Internet.email,
        password:   Faker::Internet.password(8)
    )
end
users = User.all

# Creates Wikis
10.times do 
    Wiki.create!(
        user:       users.sample,
        title:      Faker::Lorem.word,
        body:       Faker::Lorem.paragraph
    )
end
wiki = Wiki.all

# Create an admin user
admin = User.create!(
    # name:       'Admin User',
    email:      'admin@example.com',
    password:   'helloworld',
    role:       'admin'
)

# Create a member 
member = User.create!(
    # name:       'Member User',
    email:      'member@example.com',
    password:   'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"