class RemoveDescriptionFromPlayListSong < ActiveRecord::Migration[5.2]
  def change
    remove_column :play_list_songs, :description, :text
  end
end
