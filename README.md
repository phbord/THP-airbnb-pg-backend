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
|Afficher la table utilisateur|`tp User.all`|
|Créer un utilisateur|`u=User.create(email: "ph@gmai.com", phone_number: "0133554433", description:"test")`|
|Afficher une instance d'utilisateur|`tp u`|
|Vérifier la relation d'un utilisateur avec ses listings|`User.new.listings`|
|Afficher la table ville|`tp City.all`|
|Créer une ville|`c=City.create(name:"Paris", zip_code:"75000")`|
|Afficher une instance d'une ville|`tp c`|
|Vérifier la relation d'une ville avec ses listings|`City.new.listings`|
|Afficher la table |`tp Listing.all`|
|Créer un listing|`l=Listing.create(available_beds:2, price:30, description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque interdum rutrum sodales. Nullam mattis fermentum libero, non volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit.", has_wifi:true, welcome_message:"bienvenue", city_id:1, administrator_id:1)`|
|Afficher une instance d'un listing|`tp l`|
|Vérifier la relation d'un listing avec ses réservations|`Listing.new.reservations`|
|Afficher la table réservation|`tp Reservation.all`|
|Créer une réservation|`r=Reservation.create(start_date:"2021-03-10 12:00:00", end_date:"2021-03-20 12:00:00", guest_id:1, listing_id:1)`|
|Afficher une instance d'une réservation|`tp r`|
|Exécution de la méthode "start_must_be_before_end" avec un ROLLBACK|`r=Reservation.create(end_date: "2021-07-07 12:00:00", start_date: "2021-07-09 12:00:00", guest: User.all.sample, listing: Listing.all.sample)`|
|_idem_ avec un COMMIT|`r=Reservation.create(end_date: "2021-07-07 12:00:00", start_date: "2021-07-03 12:00:00", guest: User.all.sample, listing: Listing.all.sample)`|
||`l=Listing.create(available_beds: 2, price: 30, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque interdum rutrum sodales. Nullam mattis fermentum libero, non volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit.", has_wifi:true, welcome_message:"bienvenue", city_id:1, administrator_id:1)`|


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