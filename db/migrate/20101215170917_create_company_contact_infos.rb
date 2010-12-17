class CreateCompanyContactInfos < ActiveRecord::Migration
  def self.up
    create_table :company_contact_infos do |t|
      t.integer :company_id
      t.string :address_en
      t.string :address_zh
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :company_contact_infos
  end
end
