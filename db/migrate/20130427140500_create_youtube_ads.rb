class CreateYoutubeAds < ActiveRecord::Migration
  def self.up
    create_table :youtube_ads do |t|
      t.string :name
      t.string :url
      t.integer :time_interval
      t.integer :width
      t.integer :height
      t.integer :venue_id
      t.timestamps
    end
  end

  def self.down
    drop_table :youtube_ads
  end
end
