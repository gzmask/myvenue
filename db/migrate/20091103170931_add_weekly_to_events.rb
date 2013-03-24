class AddWeeklyToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :weekly, :string
  end

  def self.down
    remove_column :events, :weekly
  end
end
