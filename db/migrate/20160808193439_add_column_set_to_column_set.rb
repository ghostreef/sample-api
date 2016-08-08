class AddColumnSetToColumnSet < ActiveRecord::Migration
  def change
    add_column :permitted_column_sets, :column_set, :string
  end
end
