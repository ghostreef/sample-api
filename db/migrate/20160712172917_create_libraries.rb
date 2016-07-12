class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.references :address, index: true, foreign_key: true
      t.integer :year_built
      t.string :name

      t.timestamps null: false
    end
  end
end
