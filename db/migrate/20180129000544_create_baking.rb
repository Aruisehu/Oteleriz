class CreateBaking < ActiveRecord::Migration[5.1]
    def change
        create_table :bakings do |t|
            t.string :name
            t.text :description
        end
        add_reference :formulas, :baking, {to_table: :bakings}
    end
end
