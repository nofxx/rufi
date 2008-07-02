class CreateLogfiles < ActiveRecord::Migration
  def self.up
    create_table :logfiles do |t|
      t.string :type               
      t.string :name
      t.string :state
      t.string :source_content_type
      t.string :source_file_name
      t.integer :source_file_size
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :logfiles
  end
end
