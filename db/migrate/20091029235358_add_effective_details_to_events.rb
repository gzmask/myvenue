class AddEffectiveDetailsToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :effective_date, :date
    add_column :events, :defective_date, :date
  end

  def self.down
    remove_column :events, :defective_date
    remove_column :events, :effective_date
  end
end
