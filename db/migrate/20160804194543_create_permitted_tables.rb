class CreatePermittedTables < ActiveRecord::Migration
  def change
    create_table :permitted_tables do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
