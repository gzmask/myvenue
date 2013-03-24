class AddTopLeftToDisplay < ActiveRecord::Migration
  def self.up
    add_column :displays, :top, :integer
    add_column :displays, :left, :integer
  end

  def self.down
    remove_column :displays, :left
    remove_column :displays, :top
  end
end
