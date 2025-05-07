class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :event_type, null: false
      t.string :name, null: false
      t.datetime :starts_at
      t.datetime :ends_at
      t.float :longitude
      t.float :latitude
      t.string :address
      t.boolean :active

      t.timestamps
    end

    add_index :events, :name
  end
end
