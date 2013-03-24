class AddWidthheightToDisplays < ActiveRecord::Migration
  def self.up
    add_column :displays, :width, :integer
    add_column :displays, :height, :integer
  end

  def self.down
    remove_column :displays, :width
    remove_column :displays, :height
  end
end
