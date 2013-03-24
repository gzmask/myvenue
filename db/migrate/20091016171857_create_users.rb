class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.integer :venue_id
      t.string :password
      t.boolean :is_client
      t.boolean :is_admin
      t.boolean :is_developer

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
