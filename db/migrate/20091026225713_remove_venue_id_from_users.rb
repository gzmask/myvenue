class RemoveVenueIdFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :venue_id
  end

  def self.down
    add_column :users, :venue_id, :integer
  end
end
