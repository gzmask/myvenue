class AddTimeIntervalToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :time_interval, :integer
  end

  def self.down
    remove_column :venues, :time_interval
  end
end
