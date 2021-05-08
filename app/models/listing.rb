class ReservationValidator < ActiveRecord::Validator
    def validate(record)
    end
end

class Listing < ApplicationRecord
    validates :available_beds,
        presence: true,
        :numericality => { only_integer: true, :greater_than => 0 }
    validates :price,
        presence: true,
        :numericality => { only_integer: true, :greater_than => 0 }
    validates :description,
        presence: true,
        length: { minimum: 140 }
    validates :welcome_message,
        presence: true

    belongs_to :city
    belongs_to :administrator, class_name: 'User'
    has_many :reservations

    before_create :overlaping_reservation

    # vérifie dans toutes les réservations du listing, s'il y a une réservation qui tombe sur le "datetime" en entrée
    def overlaping_reservation?(datetime)
        # `datetime` : date de départ de la réservation à tester
        # `self.reservations` : toutes les instances de Reservation du listing courant, cad "reservations", équivalent à la référence `has_many :reservations`
            # similaire à `self.Reservation.find_by(listing_id: self.id)`
        self.reservations.each do |r|
            return true if r.start_date.to_i <= datetime.to_i && datetime.to_i < r.end_date.to_i
            return false
        end
    end
end
