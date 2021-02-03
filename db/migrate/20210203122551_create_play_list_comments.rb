class CreatePlayListComments < ActiveRecord::Migration[5.2]
  def change
    create_table :play_list_comments do |t|
      t.integer :user_id
      t.integer :play_list_id
      t.text :content

      t.timestamps
    end
  end
end
