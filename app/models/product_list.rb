class ProductList
  include MongoMapper::Document

  many :products, :as => :productable

  belongs_to :photographer

  def albums
    ret = []
    self.products.each do |product|
      if product.type == 'album'
        ret << product
      end
    end
    ret
  end

  def prints
    ret = []
    self.products.each do |product|
      if product.type == 'print'
        self.printList << product
      end
    end
    ret
  end
end
