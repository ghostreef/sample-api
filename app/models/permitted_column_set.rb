class PermittedColumnSet < ActiveRecord::Base
  validates :name, :slug, :permitted_table, presence: true

  serialize :column_set, JSON

  belongs_to :permitted_table

  def all_columns
    # for sqlite3
    ActiveRecord::Base.connection.exec_query("pragma table_info(#{permitted_table.name})").rows.map{ |row| row[1] }

    #  for oracle, more or less
    # ActiveRecord::Base.connection.exec_query("DESC #{permitted_table.name}").rows.map{ |row| row[0] }
  end
end
