class CreateDisplays < ActiveRecord::Migration
  def self.up
    create_table :displays do |t|
      t.string :name
      t.boolean :is_customize
      t.text :html
      t.text :css
      t.integer :venue_id

      t.timestamps
    end
  end

  def self.down
    drop_table :displays
  end
end
