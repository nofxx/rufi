class CreateAps < ActiveRecord::Migration
  def self.up
    create_table :aps do |t|
      t.references :country, :region, :city
      
      t.string :essid, :key, :limit => 150
      t.string :mac, :limit => 15
      t.string :enc, :limit => 10
      t.string :ip, :mask, :limit => 25
      t.boolean :dhcp
      t.integer :channel


      t.timestamps
    end
  end

  def self.down
    drop_table :aps
  end
end
