class Order < ApplicationRecord
    belongs_to :service, optional: true
    belongs_to :group, optional: true
    has_many :formulas

    def confirmed?
        self.confirmed
    end

    def service?
        !self.service.blank?
    end

    validates :name, uniqueness: { scope: :service_id }, if: :service?

    def summary
        self.formulas.map do |f|
            f.summary
        end.reduce do |h, el|
            h.merge(el) do |k, old_v, new_v|
                old_v + new_v
            end
        end
    end
end
