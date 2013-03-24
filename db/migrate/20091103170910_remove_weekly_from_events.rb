class RemoveWeeklyFromEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :weekly
  end

  def self.down
    add_column :events, :weekly, :integer
  end
end
