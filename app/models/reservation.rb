class Reservation < ApplicationRecord
    belongs_to :guest, class_name: 'User'
    belongs_to :listing

    def get_reservation_duration
        res = self.end_date.to_i - self.start_date.to_i
        return res / 60 / 60 / 24
    end
end
