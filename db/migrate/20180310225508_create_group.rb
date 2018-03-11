class CreateGroup < ActiveRecord::Migration[5.1]
    def change
        create_table :groups do |t|
        end

        add_reference :orders, :group, {to_table: :groups}
    end
end
