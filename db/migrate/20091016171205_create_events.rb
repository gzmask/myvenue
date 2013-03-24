class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :is_confirmed
      t.boolean :entry_time
      t.integer :schedule_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
