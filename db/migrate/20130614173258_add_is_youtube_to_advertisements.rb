class AddIsYoutubeToAdvertisements < ActiveRecord::Migration
  def self.up
    add_column :advertisements, :is_youtube, :boolean
  end

  def self.down
    remove_column :advertisements, :is_youtube
  end
end
