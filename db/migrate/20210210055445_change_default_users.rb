class ChangeDefaultUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :is_deleted, from: true, to: false
  end
end
