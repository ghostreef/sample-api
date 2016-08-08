class PermittedColumnSet < ActiveRecord::Base
  validates :name, :slug, :permitted_table, presence: true

  belongs_to :permitted_table
end
