class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.references :country, :region, :city, :user, :ap, :logfile
      
      t.string :essid, :key, :limit => 150
      
      t.float :lat, :lon, :precision => 15, :scale => 10
      
      t.string :mac, :limit => 15
      t.string :enc, :limit => 10
      t.string :ip, :limit => 29
      
      t.integer :channel, :mask

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
