class AddUuidToSubscribe < ActiveRecord::Migration[7.0]
  def change
    # Enable postgres crypto extension to use uuid in table
    enable_extension 'pgcrypto'
    # Adding uuid column
    add_column :subscribes, :uuid, :uuid, default: 'gen_random_uuid()', null: false
    # Making uuid as primary key
    rename_column :subscribes, :id, :integer_id
    rename_column :subscribes, :uuid, :id
    # Re-assign primary key
    execute 'ALTER TABLE subscribes drop constraint subscribes_pkey'
    execute 'ALTER TABLE subscribes ADD PRIMARY KEY (id)'
    # Dropping old integer_id
    execute 'ALTER TABLE ONLY subscribes ALTER COLUMN integer_id DROP DEFAULT;'
    change_column_null :subscribes, :integer_id, true
    execute 'DROP SEQUENCE IF EXISTS subscribes_id_seq'
  end
end
