# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

2.times do |n|
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(email: email,
               password:              password,
               password_confirmation: password)
end

users = User.all
links = Link.all
20.times do |n|
  title = Faker::Company.name
  url = Faker::Internet.url
  votes = rand(0..34)
  author = Faker::Name.name
  body = Faker::Lorem.paragraph(2)
  users.each { |user| user.links.create!(title: title, url: url, votes: votes) }
end