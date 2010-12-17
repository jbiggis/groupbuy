class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.string :title_en
      t.string :title_zh
      t.string :description_en
      t.string :description_zh
      t.decimal :price
      t.decimal :value
      t.text :summary_en
      t.text :summary_zh
      t.text :fine_print_en
      t.text :fine_print_zh
      t.datetime :expiration_date
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :showoff, :default => false
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :deals
  end
end
