class CreateFormula < ActiveRecord::Migration[5.1]
    def change
        create_table :formulas do |t|
            t.boolean :has_starter
            t.boolean :has_dish
            t.boolean :has_dessert
            t.decimal :price, precision: 9, scale: 2
        end
        add_reference :formulas, :starter, {to_table: :starters}
        add_reference :formulas, :dish, {to_table: :dishes}
        add_reference :formulas, :dessert, {to_table: :desserts}
        create_join_table :orders, :formulas
    end
end
