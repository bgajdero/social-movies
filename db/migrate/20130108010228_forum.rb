class Forum < ActiveRecord::Migration
  def up
    create_table :forums do |t|
      t.string :key
      t.text   :remote_url
      t.integer :name

      t.timestamps
    end
    
    add_index :forums, :key
  end

  def down
  end
end
