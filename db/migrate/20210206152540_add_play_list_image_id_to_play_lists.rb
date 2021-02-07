class AddPlayListImageIdToPlayLists < ActiveRecord::Migration[5.2]
  def change
    add_column :play_lists, :play_list_image_id, :string
  end
end
