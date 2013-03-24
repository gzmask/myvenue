class AddMonthlyToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :monthly, :string
  end

  def self.down
    remove_column :events, :monthly
  end
end
