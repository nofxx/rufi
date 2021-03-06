class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.belongs_to :country
            
      t.string :name, :limit => 40
      t.string :code, :limit => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :regions
  end
end
