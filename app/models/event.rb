class Event
  include MongoMapper::Document

  before_create :generate_client

  key :partner1, String
  key :partner2, String
  key :date, Date
  key :location, String
  key :client_email, String

  one :registry
  belongs_to :client
  belongs_to :photographer

  private
    def generate_client
      client = Client.find(email: self.client_email)
      unless client
        client = Client.create(email: self.client_email, partner1: self.partner1, partner2: self.partner2)
      end
      self.client = client
    end
end
