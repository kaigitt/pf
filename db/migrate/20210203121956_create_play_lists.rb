class CreatePlayLists < ActiveRecord::Migration[5.2]
  def change
    create_table :play_lists do |t|
      t.integer :user_id
      t.integer :tag_map_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
