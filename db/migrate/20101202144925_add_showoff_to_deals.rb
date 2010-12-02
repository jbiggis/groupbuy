class AddShowoffToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :showoff, :boolean, :default => false
  end

  def self.down
    remove_column :deals, :showoff
  end
end
