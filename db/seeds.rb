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

zip_regex = /\A([0-8][0-9]|9[0-5]|9[7-8][1-8]|2[a-b])([0-9]{3}|[0-9]{2})\z/
phone_regex = /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/

def get_faker_number(fake, regex)
    while true
        return fake unless
            fake.match?(regex)
        #if fake =~ regex
        # if fake.match?(regex)
        #     break
        # end
    end
    return fake
end

10.times do |index|
    City.create!(
        name: Faker::Address.city,
        zip_code: "#{rand(0..8)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}"
    )
end

20.times do
    phone_generated = "+33 #{rand(1..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}"
    phone_number = Faker::PhoneNumber.cell_phone.to_s
    puts "="*30
    puts phone_generated
    puts "+"*30
    User.create!(
        email: Faker::Internet.email,
        #phone_number: Faker::PhoneNumber.phone_number_with_country_code,
        #phone_number: "+33#{prng.rand(0..3)}-#{prng.rand(0..99)}-#{prng.rand(0..99)}-#{prng.rand(0..99)}-#{prng.rand(0..99)}",
        #phone_number: Faker::Base.regexify(/\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/),
        #phone_number: (/\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/).generate,
        #phone_number: get_faker_number(Faker::Address.phone_number, phone_regex),
        #phone_number: "+33-1-44-44-44-44",
        phone_number: phone_generated,
        #phone_number: phone_number,
        description: Faker::Lorem.sentence(word_count: 5)
    )
end

50.times do
    Listing.create!(
        available_beds: rand(1..3),#Faker::Number.number(digits: 1).abs,
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