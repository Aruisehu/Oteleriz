class CreateService < ActiveRecord::Migration[5.1]
    def change
        create_table :services do |t|
            t.datetime :start_time
            t.datetime :end_time

            t.timestamps
        end

        remove_reference :orders, :meal
        remove_column :meals, :services

        add_reference :services, :meal, {to_table: :meals}
        add_reference :orders, :service, {to_table: :services}
    end
end
