class RemoveNameFromPlayListSong < ActiveRecord::Migration[5.2]
  def change
    remove_column :play_list_songs, :name, :string
  end
end
