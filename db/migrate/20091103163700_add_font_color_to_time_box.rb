class AddFontColorToTimeBox < ActiveRecord::Migration
  def self.up
    add_column :time_boxes, :font_color, :string
  end

  def self.down
    remove_column :time_boxes, :font_color
  end
end
