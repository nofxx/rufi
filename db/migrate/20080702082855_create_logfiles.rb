class CreateLogfiles < ActiveRecord::Migration
  def self.up
    create_table :logfiles do |t|   
      t.belongs_to :user, :null => false
      
      t.string :type, :limit => 20, :null => false             
      t.string :name, :limit => 50
      t.string :state, :limit => 20, :null => false
      t.string :source_content_type, :limit => 50
      t.string :source_file_name, :limit => 50
      t.integer :source_file_size
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :logfiles
  end
end
