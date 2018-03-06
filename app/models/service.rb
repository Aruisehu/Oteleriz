class Service < ApplicationRecord
    has_many :orders
    belongs_to :meal

    scope :opened, -> { where(ended: false) }
end
