class AddDetailsToSchedules < ActiveRecord::Migration
  def self.up
    add_column :schedules, :title_font_size, :integer
    add_column :schedules, :content_font_size, :integer
  end

  def self.down
    remove_column :schedules, :content_font_size
    remove_column :schedules, :title_font_size
  end
end
