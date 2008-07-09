class AddAdminToUsers < ActiveRecord::Migration
  def self.up 
    change_table :users do |t|
      t.boolean :admin, :default => false, :null => false  
    end
  end

  def self.down
    remove_column :users, :admin
  end
end
