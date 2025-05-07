class PublishEventJob < ApplicationJob
  queue_as :default

  def perform(event_id)
    event = Event.find(event_id)
    subscriptions = Subscription.where(active: true)

    subscriptions.each do |subscription|
      begin
        PublishEventToSubscriberJob.perform_later(event_id, subscription.id)
      rescue StandardError => e
        Rails.logger.error("Failed to publish event #{event.id} to subscription #{subscription.id}: #{e.message}")
      end
    end
  end
end
