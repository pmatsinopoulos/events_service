module SmsService
  class << self
    def send_sms(phone_number, message)
      return unless Rails.env.production?

      api_key = ENV["SMS_SERVICE_API_KEY"]

      conn = Faraday.new(
        url: "https://sms-api.rayo.gr/v1",
        headers: {
          "Content-Type" => "application/json",
          "Accept" => "application/json",
          "Authorization" => "Bearer #{api_key}"
        }
      )

      payload = {
        toMobileNumber: phone_number,
        fromLabel: "LovHolidays",
        smsBody: message
      }.to_json
      Rails.logger.info("Sending SMS to #{phone_number}: #{message}, fromLabel: LovHolidays")

      response = conn.post("/send_sms") do |req|
        req.body = payload
      end

      Rails.logger.info("SMS sent to #{phone_number}: #{response.status} - #{response.body}")
    end
  end
end
