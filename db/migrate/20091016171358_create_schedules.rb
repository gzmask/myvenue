class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.string :name
      t.integer :venue_id
      t.integer :top
      t.integer :left
      t.integer :width
      t.integer :height
      t.string :title_color
      t.string :title_back_color
      t.string :content_color
      t.string :content_back_color

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
