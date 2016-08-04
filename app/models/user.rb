class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: {with: /\A.*@.*\z/, message: 'format is invalid.' }
  validates :api_key, uniqueness: true

  # sometimes api key will be it's own model (for count/exp date), but here we will just attach it to the user model
  def generate_api_key
    begin
      self.api_key = SecureRandom.hex
    end while self.class.exists?(api_key: api_key)
  end
end
