class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name, :limit => 40
      t.string :code, :limit => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :countries
  end
end
