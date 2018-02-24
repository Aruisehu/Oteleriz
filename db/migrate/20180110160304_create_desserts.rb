class CreateDesserts < ActiveRecord::Migration[5.1]
    def change
        create_table :desserts do |t|
            t.column :name_translations, :jsonb
            t.column :description_translations, :jsonb
            t.decimal :price
            t.string :img_url
        end
    end
end
