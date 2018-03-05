class Payment < ApplicationRecord
    belongs_to :order

    def lyfpay_reference
        self.id.to_s(36).upcase
    end

    module Status
        def self.all
            ["ONGOING", "REFUSED", "VALIDATED"]
        end

        self.all.each do |status|
            define_method("#{status}?") do
                self.status == status
            end
        end
    end

    include Payment::Status
    validates :status, inclusion: {in: Payment::Status.all}

end
