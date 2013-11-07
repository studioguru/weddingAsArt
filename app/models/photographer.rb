require 'bcrypt'

class Photographer
	include MongoMapper::Document
	include BCrypt

	key :email, String
	key :name, String
	key :password_hash, String
	key :studio, String

	one :product_list
	many :events

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
end
