class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :synopsis
      t.integer :critics_rating
      t.string :poster

      t.timestamps
    end
  end
end
