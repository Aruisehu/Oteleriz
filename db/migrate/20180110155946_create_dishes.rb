class CreateDishes < ActiveRecord::Migration[5.1]
    def change
        create_table :dishes do |t|
            t.column :name_translations, :jsonb
            t.column :description_translations, :jsonb
            t.boolean :ask_roasting
        end
    end
end
