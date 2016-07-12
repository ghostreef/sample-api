class Library < ActiveRecord::Base
  belongs_to :address

  validates :name, presence: true
end
