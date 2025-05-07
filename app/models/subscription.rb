class Subscription < ApplicationRecord
  def publish_event(event)
    conn = Faraday.new(
      url:,
      headers: { "Content-Type" => "application/json" }
   )

    response = conn.post("") do |req|
      req.body = event.to_subscription_json
    end

    Rails.logger.debug "Subscription response: #{response.status} #{response.body}"
  end
end
