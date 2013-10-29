class Event
  include MongoMapper::Document

  key :partner1, String
  key :partner2, String

  belongs_to :client
  belongs_to :photographer
end