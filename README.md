# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : ruby-2.7.1

* System dependencies
  * gem `table_print`
  * gem `faker`

* Configuration

* Database creation
  * `rails generate model User email:string phone_number:string description:text`
  * `rails generate model City name:string zip_code:string`
  * `rails generate model Listing available_beds:integer price:integer description:string has_wifi:boolean welcome_message:text`
  * `rails generate model Reservation start_date:date end_date:date`

* Database initialization

* Deployment instructions
  * `bundle i`
  * `rails db:migrate`
  * `rails db:seed`

* Tests

|ACTION|COMMANDE|
|:---|:---|

## Base de données
- `User` représente nos utilisateurs
- Listing logements disponibles (`Accommodation` aurait été pas mal non plus comme nom)
- `City` représente les villes desservies par l'application
- `Reservation` représente les séjours

## Seeds
- Détruire la base actuelle
- 20 utilisateurs
- 10 villes
- 50 listings
- Pour chaque listing
  - 5 réservations dans le passé
  - 5 réservations dans le futur