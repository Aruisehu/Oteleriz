class Service < ApplicationRecord
    has_many :orders
    belongs_to :meal

    scope :opened, -> { where(ended: false) }

    def remaining_seats?(number_persons)
        reserved_persons = get_taken_seats

        return self.seats >= reserved_persons + number_persons
    end

    def get_remaining_seats
        return self.seats - get_taken_seats
    end

    private
    def get_taken_seats
        self.orders.map do |o|
            o.number_persons
        end.sum
    end
end
