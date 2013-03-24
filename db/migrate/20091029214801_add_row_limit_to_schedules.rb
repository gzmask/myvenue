class AddRowLimitToSchedules < ActiveRecord::Migration
  def self.up
    add_column :schedules, :row_limit, :integer
  end

  def self.down
    remove_column :schedules, :row_limit
  end
end
