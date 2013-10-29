require 'bcrypt'

class Client
  include MongoMapper::Document
	include BCrypt

  key :email, String
	key :password_hash, String

  belongs_to :photographer

  def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
end
