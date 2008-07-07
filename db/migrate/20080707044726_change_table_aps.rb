class ChangeTableAps < ActiveRecord::Migration                         
  # #
  # Kismet stuff
  def self.up                                                           
    change_table :aps do |t|
      t.float :maxrate
      t.integer :maxseenrate
      t.string :carrier, :limit => 30
      t.integer :datasize
      t.boolean :cloaked      
    end
  end

  def self.down 
    change_table :aps do |t|
      t.remove :maxrate, :maxseenrate, :carrier, :datasize, :cloaked
    end
  end
end
