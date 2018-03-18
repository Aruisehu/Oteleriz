class CloseServiceJob < ApplicationJob
    queue_as :default

    def perform(*args)
        services = Service.opened
        services.each do |s|
            if (s.start_time - 10.minutes).past?
                s.ended = true
                s.save
            end
        end
    end
end
