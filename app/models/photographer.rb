class Photographer
  include MongoMapper::Document

  key :email, String
  key :name, String

  many :clients
end
