class CreateCoupons < ActiveRecord::Migration
  def self.up
    create_table :coupons do |t|
      t.string :coupon_code
      t.integer :user_id
      t.integer :deal_id
      t.integer :status
      t.datetime :purchased_date
      t.datetime :expiration_date

      t.timestamps
    end
  end

  def self.down
    drop_table :coupons
  end
end
