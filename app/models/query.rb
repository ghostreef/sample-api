class Query < ActiveRecord::Base

  validates :name, :query, presence: true
  validates :name, uniqueness: true

  enum status: {enabled: 0,
                disabled: 1}
end
