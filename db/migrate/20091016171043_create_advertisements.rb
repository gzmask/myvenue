class CreateAdvertisements < ActiveRecord::Migration
  def self.up
    create_table :advertisements do |t|
      t.string :name
      t.string :flash_file
      t.integer :top
      t.integer :left
      t.integer :width
      t.integer :height
      t.integer :time_interval
      t.integer :venue_id

      t.timestamps
    end
  end

  def self.down
    drop_table :advertisements
  end
end
