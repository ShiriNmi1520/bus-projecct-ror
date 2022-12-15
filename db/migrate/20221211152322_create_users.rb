class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
      t.timestamps
    end
    # Change columns to not nullable
    change_column :users, :email, :string, null: false
    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name, :string, null:  false
    change_column :users, :password, :string, null: false
  end
end
