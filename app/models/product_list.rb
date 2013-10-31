class ProductList
  include MongoMapper::Document

  many :products, :as => :productable

  belongs_to :photographer
end
