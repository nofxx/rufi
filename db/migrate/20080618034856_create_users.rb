class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login,          :limit => 40
      t.string :name,           :limit => 100, :default => '', :null => true
      t.string :email,          :limit => 100
      t.string :state,          :limit => 20,  :default => 'passive', :null => false          
      t.string :crypted_password, :salt, :remember_token, :activation_code, :limit => 40    
      t.datetime :remember_token_expires_at, :activated_at, :deleted_at           
      t.timestamps
    end
    add_index :users, :login, :unique => true
  end

  def self.down
    drop_table "users"
  end
end
