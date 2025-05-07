class PublishEventToSubscriberJob < ApplicationJob
  queue_as :default

  def perform(event_id, subscription_id)
    event = Event.find(event_id)
    subscription = Subscription.find(subscription_id)
    subscription.publish_event(event)
  end
end
