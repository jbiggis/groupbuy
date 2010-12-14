class ChangeTitleInDeals < ActiveRecord::Migration
  def self.up
  	rename_column :deals, :title, :title_en
	rename_column :deals, :description, :description_en
	rename_column :deals, :fine_print, :fine_print_en
	rename_column :deals, :summary, :summary_en
	rename_column :deals, :company_name, :company_name_en
	rename_column :deals, :company_address, :company_address_en
  end

  def self.down
	rename_column :deals, :title_en, :title
	rename_column :deals, :description_en, :description
	rename_column :deals, :fine_print_en, :fine_print
	rename_column :deals, :summary_en, :summary
	rename_column :deals, :company_name_en, :company_name
	rename_column :deals, :company_address_en, :company_address
  end
end

