class CreateBaking < ActiveRecord::Migration[5.1]
    def change
        create_table :bakings do |t|
            t.column :name_translations, :jsonb
            t.column :description_translations, :jsonb
            t.column :ingredient_translations, :jsonb
        end
        add_reference :formulas, :baking, {to_table: :bakings}
    end
end
