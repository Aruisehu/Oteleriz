class Marinade < ApplicationRecord
    belongs_to :dish
    belongs_to :baking

    translates :name, :description
end
