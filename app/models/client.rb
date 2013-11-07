require 'bcrypt'

class Client
  include MongoMapper::Document
	include BCrypt

  before_create :generate_unique_signin

  key :email, String
	key :password_hash, String
	key :partner1, String
	key :partner2, String
  key :new_account_key, String

	one :event
  belongs_to :photographer
  belongs_to :buyer, :polymorphic => true

  def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

  private

    def generate_unique_signin
      self.new_account_key = SecureRandom.hex
    end
end
