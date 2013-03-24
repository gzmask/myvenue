class AddIsShowToDisplay < ActiveRecord::Migration
  def self.up
    add_column :displays, :is_show, :boolean
  end

  def self.down
    remove_column :displays, :is_show
  end
end
