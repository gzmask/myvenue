class AddTwitterToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :twitter, :string
  end

  def self.down
    remove_column :venues, :twitter
  end
end
