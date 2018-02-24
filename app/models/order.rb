class Order < ApplicationRecord
    belongs_to :service
    has_many :formulas
end
