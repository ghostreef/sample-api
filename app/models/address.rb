class Address < ActiveRecord::Base
  has_one :library

  validates :street, :city, :state, :country, presence: true
end
