class RemoveFontColorFromTimeBox < ActiveRecord::Migration
  def self.up
    remove_column :time_boxes, :font_color
  end

  def self.down
    add_column :time_boxes, :font_color, :integer
  end
end
