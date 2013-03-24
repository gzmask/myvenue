class RemoveTimeDetailsFromEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :start_time
    remove_column :events, :end_time
  end

  def self.down
    add_column :events, :end_time, :datetime
    add_column :events, :start_time, :datetime
  end
end
