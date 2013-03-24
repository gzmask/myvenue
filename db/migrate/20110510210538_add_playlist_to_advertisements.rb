class AddPlaylistToAdvertisements < ActiveRecord::Migration
  def self.up
    add_column :advertisements, :playlist_begin, :string
    add_column :advertisements, :playlist_finish, :string
  end

  def self.down
    remove_column :advertisements, :playlist_finish
    remove_column :advertisements, :playlist_begin
  end
end
