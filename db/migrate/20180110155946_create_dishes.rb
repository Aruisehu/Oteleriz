class CreateDishes < ActiveRecord::Migration[5.1]
    def change
        create_table :dishes do |t|
            t.string :name
            t.text :description
            t.boolean :ask_roasting
        end
    end
end
