require 'rufus-scheduler'

Rails.configuration.after_initialize do

    if ENV["CLOSE_SERVICES"] == "true"
        scheduler = Rufus::Scheduler.new

        scheduler.every '5m' do
            services = Service.opened
            services.each do |s|
                if (s.start_time - DateTime.now).to_f * 24 * 60 > 10
                    s.ended = true
                    s.save
                end
            end
        end
    end
end
