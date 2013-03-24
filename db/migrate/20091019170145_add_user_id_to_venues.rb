class AddUserIdToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :user_id, :integer
  end

  def self.down
    remove_column :venues, :user_id
  end
end
