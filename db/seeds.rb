# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include Faker

#Create Users

  5.times do
    user = User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password,
    confirmed_at: Time.now
    )
  end


  # Create an admin member
  admin = User.create!(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin',
  confirmed_at: Time.now
  )

  #Create a standard member
  member = User.create!(
  email:    'member@example.com',
  password: 'helloworld',
  confirmed_at: Time.now
  )

  #Create a premium member
  premium = User.create!(
    email:    'premium@example.com',
    password: 'helloworld',
    role:     'premium',
    confirmed_at: Time.now
  )

  #2nd Premium member
  premium_2 = User.create!(
    email:    'premium2@example.com',
    password: 'helloworld',
    role:     'premium',
    confirmed_at: Time.now
  )

  users = User.all

  # Create Wikis
  15.times do
    Wiki.create!(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      user: users.sample
    )
  end
  wikis = Wiki.all


puts "Seed finished"
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."