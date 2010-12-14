class AddMoreColumnsToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :title_zh, :string
    add_column :deals, :description_zh, :string
    add_column :deals, :fine_print_zh, :text
    add_column :deals, :summary_zh, :text
    add_column :deals, :company_name_zh, :string
    add_column :deals, :company_address_zh, :string
  end

  def self.down
    remove_column :deals, :company_address_zh
    remove_column :deals, :company_name_zh
    remove_column :deals, :summary_zh
    remove_column :deals, :fine_print_zh
    remove_column :deals, :description_zh
    remove_column :deals, :title_zh
  end
end
