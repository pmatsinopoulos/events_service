class CreateSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :subscriptions, :name, unique: true
  end
end
