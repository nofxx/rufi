class ChangeTableLogfiles < ActiveRecord::Migration
  # #
  # Kismet stuff
  def self.up                                                           
    change_table :aps do |t|
      t.string :version, :limit => 30
      t.timestamp :start_time, :end_time  
    end
  end

  def self.down 
    change_table :aps do |t|
      t.remove :version, :start_time, :end_time
    end
  end
end
                