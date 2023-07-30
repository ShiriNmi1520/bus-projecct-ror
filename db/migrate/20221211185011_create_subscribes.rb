class CreateSubscribes < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribes do |t|
      t.string :subscribe_id
      t.string :email
      t.string :client_id
      t.string :station_name
      t.integer :minutes_before
      t.timestamps
      # Foreign key for bus info
      add_reference :buses, :bus, index: true
    end
  end
end
