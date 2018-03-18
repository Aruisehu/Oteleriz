require 'rufus-scheduler'

Rails.configuration.after_initialize do

    if ENV["CLOSE_SERVICES"] == "true"
        scheduler = Rufus::Scheduler.new

        scheduler.every '3m' do
            CloseServiceJob.perform_later
        end
    end
end
