class CreateSplashAds < ActiveRecord::Migration
  def self.up
    create_table :splash_ads do |t|
      t.string :name
      t.string :image_file
      t.integer :time_interval
      t.integer :width
      t.integer :height
      t.integer :venue_id

      t.timestamps
    end
  end

  def self.down
    drop_table :splash_ads
  end
end
