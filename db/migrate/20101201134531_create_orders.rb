class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.integer :deal_id
      t.integer :coupon_id
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
