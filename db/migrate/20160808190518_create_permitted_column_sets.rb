# rails g model permitted_column_set name:string slug:string permitted_table:references
class CreatePermittedColumnSets < ActiveRecord::Migration
  def change
    create_table :permitted_column_sets do |t|
      t.string :name
      t.string :slug
      t.references :permitted_table, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
