class AddEventTypeToSubscriptions < ActiveRecord::Migration[8.0]
  def change
    add_column :subscriptions, :event_type, :string, null: false

    add_index :subscriptions, :event_type
  end
end
