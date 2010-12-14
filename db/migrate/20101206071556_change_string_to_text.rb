class ChangeStringToText < ActiveRecord::Migration
  def self.up
	change_table :deals do |t|
	t.change :summary, :text
	t.change :fine_print, :text
	end

  end

  def self.down
  end
end
