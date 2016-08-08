class PermittedTable < ActiveRecord::Base
  validates :name, :slug, presence: true
  validates :name, :slug, uniqueness: true
  validates :name, inclusion: { in: proc { PermittedTable.tables } }

  has_many :permitted_column_sets

  def self.tables
    # SQLITE3
    ActiveRecord::Base.connection.exec_query("SELECT name FROM sqlite_master WHERE type='table'").rows.flatten

    # ORACLE
    # ActiveRecord::Base.connection.exec_query("SELECT table_name FROM user_tables").rows.flatten
  end
end
