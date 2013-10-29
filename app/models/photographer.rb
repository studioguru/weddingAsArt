require 'bcrypt'

class Photographer
	include MongoMapper::Document
	include BCrypt

	key :email, String
	key :name, String
	key :password_hash, String
	key :studio, String
	key :event_ids, Array

	one :product_list
	many :events, :in => :event_ids

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
end
