class Product
  include MongoMapper::Document

  key :name, String
  key :type, String
  key :price, Number
  key :dimensions, Hash

  belongs_to :productable, :polymorphic => true
end
