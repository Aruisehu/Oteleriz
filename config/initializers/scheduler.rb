require 'rufus-scheduler'

Rails.configuration.after_initialize do

    if ENV["CLOSE_SERVICES"] == "true"
        scheduler = Rufus::Scheduler.new

        scheduler.every '5m' do
            services = Service.opened
            services.each do |s|
            if (s.start_time - 10.minutes).past?
                s.ended = true
                s.save
            end
        end
    end
end
