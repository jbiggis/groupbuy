class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.integer :deal_id
      t.string :name_en
      t.string :name_zh
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
