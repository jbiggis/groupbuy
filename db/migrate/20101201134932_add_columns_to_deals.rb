class AddColumnsToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :company_name, :string
    add_column :deals, :company_address, :string
    add_column :deals, :company_website, :string
    add_column :deals, :company_phone, :string
    add_column :deals, :image_file_name, :string
    add_column :deals, :image_content_type, :string
    add_column :deals, :image_file_size, :integer
    add_column :deals, :image_updated_at, :datetime
  end

  def self.down
    remove_column :deals, :image_updated_at
    remove_column :deals, :image_file_size
    remove_column :deals, :image_content_type
    remove_column :deals, :image_file_name
    remove_column :deals, :company_phone
    remove_column :deals, :company_website
    remove_column :deals, :company_address
    remove_column :deals, :company_name
  end
end
