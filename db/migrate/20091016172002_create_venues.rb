class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.string :weather_code
      t.integer :time_zone
      t.string :background_image

      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
