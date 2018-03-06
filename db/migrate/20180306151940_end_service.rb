class EndService < ActiveRecord::Migration[5.1]
    def change
        change_table :services do |t|
            t.boolean :ended, default: false
            t.integer :seats
        end
    end
end
