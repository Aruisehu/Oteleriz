class CreatePayments < ActiveRecord::Migration[5.1]
    def change
        create_table :payments do |t|
            t.string :status

            t.timestamps
        end

        add_reference :payments, :order, {to_table: :orders}
    end
end
