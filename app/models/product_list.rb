class ProductList
  include MongoMapper::Document

  key :albums, Array
  key :print_media, Array
  key :specialties, Array

  many :products, :in => :albums
  many :products, :in => :print_media
  many :products, :in => :specialties

  belongs_to :photographer
end
