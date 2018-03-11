class Order < ApplicationRecord
    belongs_to :service, optional: true
    has_many :formulas

    def confirmed?
        self.confirmed
    end

    def service?
        !self.service.blank?
    end

    validates :name, uniqueness: { scope: :service_id }, if: :service?
end
