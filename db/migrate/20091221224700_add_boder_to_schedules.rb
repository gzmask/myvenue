class AddBoderToSchedules < ActiveRecord::Migration
  def self.up
    add_column :schedules, :is_border, :boolean
  end

  def self.down
    remove_column :schedules, :is_border
  end
end
