class Service < ApplicationRecord
    has_many :orders
    belongs_to :meal

    scope :opened, -> { where(ended: false) }

    def remaining_seats?(number_persons)
        reserved_persons = self.orders.map do |o|
            o.number_persons
        end.sum

        return self.seats >= reserved_persons + number_persons
    end
end
