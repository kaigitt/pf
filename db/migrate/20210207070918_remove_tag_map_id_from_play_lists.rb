class RemoveTagMapIdFromPlayLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :play_lists, :tag_map_id, :integer
  end
end
