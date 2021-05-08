class Listing < ApplicationRecord
    validates :available_beds, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
    validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
    validates :description, presence: true, length: { minimum: 140 }
    validates :welcome_message, presence: true
    belongs_to :city
    belongs_to :administrator, class_name: 'User'
    has_many :reservations

    before_create :overlaping_reservation

    def overlaping_reservation?(datetime)
        # vérifie dans toutes les réservations du listings
        # s'il y a une réservation qui tombe sur le datetime en entrée
        Reservation.find_by(listing_id: self.id).each do |r|
            condition_1 = (datetime.start_date < r.end_date.to_i && datetime.start_date > r.start_date.to_i)
            condition_2 = (datetime.end_date < r.end_date.to_i && datetime.end_date > r.start_date.to_i)
            return false if condition_1 || condition_2
        end
    end
end
