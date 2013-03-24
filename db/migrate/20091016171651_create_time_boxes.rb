class CreateTimeBoxes < ActiveRecord::Migration
  def self.up
    create_table :time_boxes do |t|
      t.string :name
      t.integer :time_zone
      t.integer :top
      t.integer :left
      t.integer :font_size
      t.integer :font_color
      t.integer :venue_id
      t.boolean :is_show

      t.timestamps
    end
  end

  def self.down
    drop_table :time_boxes
  end
end
