class CreateMenus < ActiveRecord::Migration[5.1]
    def change
        create_table :menus do |t|
            t.integer :price
        end
        create_join_table :orders, :menus
    end
end
