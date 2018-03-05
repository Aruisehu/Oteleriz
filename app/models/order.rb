class Order < ApplicationRecord
    belongs_to :service
    has_many :formulas
    has_many :payments

    def total_price
        self.formulas.map do |f|
            f.get_price
        end.sum
    end

    def lyfpay_reference
        self.id.to_s(36).upcase
    end
end
