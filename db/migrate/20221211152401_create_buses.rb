class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :bus_number
      t.integer :direction
      t.timestamps
    end
    # Add array type column
    add_column :buses, :stations, :string, array: true, default: []
    # Set limit for bus number
    change_column :buses, :bus_number, :string, :limit => 10
  end
end
