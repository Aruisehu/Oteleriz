class CreateMeals < ActiveRecord::Migration[5.1]
    def change
        create_table :meals do |t|
            t.float :services
            t.datetime :start_time
            t.datetime :end_time
        end
        add_reference :orders, :meal, foreign_key: {to_table: :meals}
    end
end
