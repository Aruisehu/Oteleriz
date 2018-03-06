class Order < ApplicationRecord
    belongs_to :service, optional: true
    has_many :formulas

    def confirmed?
        self.confirmed
    end
end
