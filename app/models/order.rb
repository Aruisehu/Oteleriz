class Order < ApplicationRecord
    belongs_to :service
    has_many :formulas

    def confirmed?
        self.confirmed
    end
end
