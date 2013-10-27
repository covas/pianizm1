class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :length
      t.integer :score
      t.string :author
      t.timestamps
    end
  end
end
