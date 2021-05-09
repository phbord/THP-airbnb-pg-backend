# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'string_pattern'

Faker::Config.locale = "fr"

City.destroy_all
User.destroy_all
Listing.destroy_all
Reservation.destroy_all

10.times do |index|
    City.create!(
        name: Faker::Address.city,
        zip_code: "#{rand(0..8)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}"
    )
end

20.times do
    phone_generated = "+33 #{rand(1..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}"
    phone_number = Faker::PhoneNumber.cell_phone.to_s

    User.create!(
        email: Faker::Internet.email,
        phone_number: phone_generated,
        description: Faker::Lorem.sentence(word_count: 5)
    )
end

50.times do
    Listing.create!(
        available_beds: rand(1..3),
        price: Faker::Number.within(range: 0..300),
        description: Faker::Lorem.characters(number: 170, min_alpha: 140),
        has_wifi: Faker::Boolean.boolean,
        welcome_message: Faker::Lorem.words(number: 4),
        city: City.all.sample,
        administrator: User.all.sample
    )
end

5.times do
    Reservation.create!(
        start_date: Faker::Date.backward(days: 10),
        end_date: Faker::Date.backward(days: 23),
        guest: User.all.sample,
        listing: Listing.all.sample
    )

    Reservation.create!(
        start_date: Faker::Date.forward(days: 10),
        end_date: Faker::Date.forward(days: 23),
        guest: User.all.sample,
        listing: Listing.all.sample
    )
end

puts "-"*30
puts 'Base de données remplies !'
puts "-"*30