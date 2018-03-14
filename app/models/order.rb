class OrderValidator < ActiveModel::Validator
    def validate(record)
        if record.formulas.count < record.number_persons
            record.errors[:base] << "Trop de personnes pour cette commande"
        end
    end
end

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

    validates :name, uniqueness: { scope: :service_id, message: "Ce nom de commande a déjà été pris" }, if: :service?
    validates :name, presence: { message: "Le nom de commande ne peut pas être vide"}, if: :service?
    validates_with OrderValidator

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
