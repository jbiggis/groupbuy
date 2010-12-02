class DeviseCreateAdmins < ActiveRecord::Migration
  def self.up
    create_table(:admins) do |t|
      t.database_authenticatable :null => false
      t.trackable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.boolean :super, :default => true

      # t.token_authenticatable
      # t.confirmable


      t.timestamps
    end

    add_index :admins, :email,                :unique => true
    add_index :admins, :unlock_token,         :unique => true
    # add_index :admins, :confirmation_token,   :unique => true

  end

  def self.down
    drop_table :admins
  end
end
