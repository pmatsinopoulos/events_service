class NotifyTravellersJob < ApplicationJob
  queue_as :default

  def perform(event, results_page_url))
    sms_body = "Event: #{event["name"]}, Date: #{event["starts_at"]}, Location: #{event["address"]}, More Info: #{results_page_url}"
    Traveller.where(event_type: event["event_type"]).find_each do |traveller|
      begin
        SmsService.send_sms(traveller.mobile, sms_body)
      rescue StandardError => e
        Rails.logger.error("Failed to send SMS to #{traveller.mobile}: #{e.message}")
      end
    end
  end
end
