class CreateWeatherBoxes < ActiveRecord::Migration
  def self.up
    create_table :weather_boxes do |t|
      t.string :name
      t.string :city_code
      t.integer :top
      t.integer :left
      t.integer :width
      t.boolean :is_show
      t.integer :venue_id

      t.timestamps
    end
  end

  def self.down
    drop_table :weather_boxes
  end
end
