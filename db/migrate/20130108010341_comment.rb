class Comment < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :forum
      t.string :key
      t.text   :remote_url
      t.text   :body
      t.integer :parent_key
      t.string :from
      t.string :to

      t.timestamps
    end
    add_index :comments, :key
    
  end

  def down
  end
end
