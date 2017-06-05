class AddUserToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :user_identity, :integer
    add_index :wikis, :user_identity
  end
end
