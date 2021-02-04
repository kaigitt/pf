class AddSongIdToPlayListSong < ActiveRecord::Migration[5.2]
  def change
    add_column :play_list_songs, :song_id, :integer
  end
end
