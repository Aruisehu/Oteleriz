class AddRoles < ActiveRecord::Migration[5.1]
    def change
        change_table :users do |t|
            t.string :role, default: "user"
        end
        execute <<-SQL
            UPDATE users SET role='admin' WHERE email='cookmeupstartup@gmail.com';
        SQL
    end
end
