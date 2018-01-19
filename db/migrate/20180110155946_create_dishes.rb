class CreateDishes < ActiveRecord::Migration[5.1]
    def change
        create_table :dishes do |t|
            t.string :name
            t.text :description
            t.string :baking # Wok / Papillotes/ Fusio
            t.string :roasting
            t.boolean :ask_roasting
        end

        create_join_table :orders, :dishes
    end
end
