class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.references :ap
      
      t.string :mac, :limit => 20
      t.string :ip, :limit => 25

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
