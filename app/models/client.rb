class Client
  include MongoMapper::Document

  key :email, String
  belongs_to :photographer
end
