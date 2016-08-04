class RemoveEmailFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email, :users
  end
end
