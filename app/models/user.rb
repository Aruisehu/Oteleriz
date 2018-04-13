class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable,
        :rememberable, :trackable, :validatable, :omniauthable

    module Role
        def self.all
            ["user", "admin"]
        end
        self.all.each do |role|
            define_method("#{role}?") do
                self.role == role
            end
        end
    end

    include User::Role
    validates :role, inclusion: {in: User::Role.all, message: "There is no such role"}
end
