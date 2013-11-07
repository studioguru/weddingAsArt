class Registry
  include MongoMapper::Document

  many :wished_products
  many :fulfilled_products

  belongs_to :event
end

class WishedProduct
	include MongoMapper::EmbeddedDocument

	key :quantity, Integer

	one :product, :as => :productable
end

class FulfilledProduct
	include MongoMapper::EmbeddedDocument

	belongs_to :buyer, :as => :buyer
	belongs_to :event_image
	one :product, :as => :productable
end