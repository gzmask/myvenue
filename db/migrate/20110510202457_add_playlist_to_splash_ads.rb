class AddPlaylistToSplashAds < ActiveRecord::Migration
  def self.up
    add_column :splash_ads, :playlist_start, :string
    add_column :splash_ads, :playlist_end, :string
  end

  def self.down
    remove_column :splash_ads, :playlist_end
    remove_column :splash_ads, :playlist_start
  end
end
