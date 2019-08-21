class ChangeColumnForUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :uid, :integer
  end
end
