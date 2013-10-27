class CreateSongLists < ActiveRecord::Migration
  def change
    create_table :song_lists do |t|

      t.timestamps
    end
  end
end
