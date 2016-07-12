class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors

  validates :title, presence: true
  validates :isbn, numericality: true
end
