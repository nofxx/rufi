class CreateAps < ActiveRecord::Migration
  def self.up
    create_table :aps do |t|
      t.references :country, :region, :city, :user, :logfile
      
      t.string :essid, :key, :limit => 150
      
      t.float :lat, :lon, :precision => 15, :scale => 10
      
      t.string :mac, :limit => 15
      t.string :enc, :limit => 10
      t.string :ip, :limit => 29
      
      t.integer :channel, :mask
      
      t.boolean :dhcp

      t.timestamps
    end
  end

  def self.down
    drop_table :aps
  end
end
