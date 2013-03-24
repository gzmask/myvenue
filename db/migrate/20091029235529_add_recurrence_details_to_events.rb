class AddRecurrenceDetailsToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
    add_column :events, :recurrence, :integer
    add_column :events, :weekly, :integer
    add_column :events, :monthly, :integer
  end

  def self.down
    remove_column :events, :monthly
    remove_column :events, :weekly
    remove_column :events, :recurrence
    remove_column :events, :end_time
    remove_column :events, :start_time
  end
end
