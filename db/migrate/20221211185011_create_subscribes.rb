class CreateSubscribes < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribes do |t|

      t.timestamps
    end
  end
end
