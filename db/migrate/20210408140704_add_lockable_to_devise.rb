class AddLockableToDevise < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :failed_attempts, :integer, default: 0, null: false # ロックを使うか否か
    add_column :users, :unlock_token, :string # アンロックの際に必要なもの
    add_column :users, :locked_at, :datetime
    add_index :users, :unlock_token, unique: true
  end
end
