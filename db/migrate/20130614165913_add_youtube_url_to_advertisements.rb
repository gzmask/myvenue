class AddYoutubeUrlToAdvertisements < ActiveRecord::Migration
  def self.up
    add_column :advertisements, :youtube_url, :string
  end

  def self.down
    remove_column :advertisements, :youtube_url
  end
end
