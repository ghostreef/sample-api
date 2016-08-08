class PermittedColumnSet < ActiveRecord::Base
  validates :name, :slug, :permitted_table, presence: true

  serialize :column_set, JSON

  belongs_to :permitted_table

  def all_columns
    permitted_table.all_columns
  end
end
