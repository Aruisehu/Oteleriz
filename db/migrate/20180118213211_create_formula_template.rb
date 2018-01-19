class CreateFormulaTemplate < ActiveRecord::Migration[5.1]
    def change
        create_table :formula_templates do |t|
            t.boolean :has_starter
            t.boolean :has_dish
            t.boolean :has_dessert
            t.decimal :price, precision: 9, scale: 2
        end

        add_reference :formulas, :formula_template, {to_table: :formula_templates]
    end
end
