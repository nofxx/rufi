class CreateAps < ActiveRecord::Migration
  def self.up
    create_table :aps do |t|
      t.string :essid
      t.string :mac
      t.string :enc
      t.string :key
      t.string :ip
      t.string :mask
      t.boolean :dhcp
      t.integer :channel
      t.references :pais
      t.refences :cidade
      t.references :estado

      t.timestamps
    end
  end

  def self.down
    drop_table :aps
  end
end
