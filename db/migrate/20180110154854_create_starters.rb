class CreateStarters < ActiveRecord::Migration[5.1]
    def change
        create_table :starters do |t|
            t.string :name
            t.text :description
        end
        create_join_table :orders, :starters

    end
end
