class Reservation < ApplicationRecord
    belongs_to :guest, class_name: 'User'
    belongs_to :listing

    before_create :start_must_be_before_end

    def get_duration
        res = self.end_date.to_i - self.start_date.to_i
        return res / 60 / 60 / 24
    end

    private

    def start_must_be_before_end
        # `unless` : équivaut à `while not`
        errors.add(:start_date, "must be before end date") unless
            start_date < end_date
    end
end
