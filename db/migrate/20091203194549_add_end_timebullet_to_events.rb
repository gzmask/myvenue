class AddEndTimebulletToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :entry_end_time, :boolean
    add_column :events, :entry_bullets, :boolean
  end

  def self.down
    remove_column :events, :entry_end_time
    remove_column :events, :entry_bullets
  end
end
