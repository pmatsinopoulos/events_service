class CreateTravellers < ActiveRecord::Migration[8.0]
  def change
    create_table :travellers do |t|
      t.string :mobile, null: false
      t.string :event_type, null: false

      t.timestamps
    end

    add_index :travellers, :mobile
    add_index :travellers, %i[mobile event_type], unique: true
  end
end
