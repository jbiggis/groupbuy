class AddSummaryToDeal < ActiveRecord::Migration
  def self.up
    add_column :deals, :summary, :string
  end

  def self.down
    remove_column :deals, :summary
  end
end
