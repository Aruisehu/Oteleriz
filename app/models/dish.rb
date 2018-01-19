class Dish < ApplicationRecord
    has_many :formulas
    has_and_belongs_to_many :orders

    module Baking
        def self.all
            ["wok", "papillotte", "fusio"]
        end

        self.all.each do |baking|
            define_method("#{baking}?") do
                self.baking == baking
            end
        end
    end



end
