class CreatePlayListSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :play_list_songs do |t|
      t.integer :play_list_id
      t.integer :artist_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
