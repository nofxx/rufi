class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.references :country
            
      t.string :name, :limit => 40
      t.string :code, :limit => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end
