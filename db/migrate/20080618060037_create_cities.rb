class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.belongs_to :country, :region
      
      t.string :name, :limit => 40
      t.string :code, :limit => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :cities
  end
end
