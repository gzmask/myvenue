class AddIsTitleToSchedules < ActiveRecord::Migration
  def self.up
    add_column :schedules, :is_title, :boolean
  end

  def self.down
    remove_column :schedules, :is_title
  end
end
