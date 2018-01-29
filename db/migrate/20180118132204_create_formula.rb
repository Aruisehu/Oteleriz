class CreateFormula < ActiveRecord::Migration[5.1]
    def change
        create_table :formulas do |t|
            t.string :roasting
        end
        add_reference :formulas, :starter, {to_table: :starters}
        add_reference :formulas, :dish, {to_table: :dishes}
        add_reference :formulas, :dessert, {to_table: :desserts}
        create_join_table :orders, :formulas
    end
end
