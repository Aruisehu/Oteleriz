class CreateOrderTable < ActiveRecord::Migration[5.1]
    def change
        create_table :orders do |t|
            t.string :email
            t.string :name
            t.boolean :confirmed
            t.boolean :newsletter
            t.integer :number_persons
        end
    end
end
