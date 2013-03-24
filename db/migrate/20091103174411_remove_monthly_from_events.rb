class RemoveMonthlyFromEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :monthly
  end

  def self.down
    add_column :events, :monthly, :integer
  end
end
