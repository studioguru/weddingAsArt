class ProductList
  include MongoMapper::Document

  many :albums, :as => :productable
  many :print_media, :as => :productable
  many :specialties, :as => :productable

  belongs_to :photographer
end
