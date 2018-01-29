class CreateMarinade < ActiveRecord::Migration[5.1]
    def change
        create_table :marinades do |t|
            t.string :name
            t.text :description
        end
        add_reference :marinades, :baking, {to_table: :bakings}
        add_reference :marinades, :dish, {to_table: :dishes}
    end
end
