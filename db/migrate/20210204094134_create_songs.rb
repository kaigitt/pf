class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :artist_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
