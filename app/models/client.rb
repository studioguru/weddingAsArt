require 'bcrypt'

class Client
  include MongoMapper::Document
	include BCrypt

  key :email, String
	key :password_hash, String
	key :partner1, String
	key :partner2, String

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
end
