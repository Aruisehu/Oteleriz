class CreateStarters < ActiveRecord::Migration[5.1]
    def change
        create_table :starters do |t|
            t.column :name_translations, :jsonb
            t.column :description_translations, :jsonb
        end
    end
end
