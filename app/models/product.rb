class Product
  class DollarValue
    def self.to_mongo(value)
      if value.nil?
        nil
      else
        value.round(2).to_s
      end
    end

    def self.from_mongo(value)
      value.nil? ? nil : value.to_i
    end
  end

  include MongoMapper::Document

  key :name, String
  key :type, String
  key :price, DollarValue
  key :dimensions, Hash

  def width
    if self.dimensions.nil? || !self.dimensions.has_key?('width')
      ''
    else
      self.dimensions.width
    end
  end

  def width=(val)
    self.dimensions.nil? ? self.dimensions = { width: val } : self.dimensions['width'] = val
  end

  def height
    if self.dimensions.nil? || !self.dimensions.has_key?('height')
      ''
    else
      self.dimensions.height
    end
  end

  def height=(val)
    self.dimensions.nil? ? self.dimensions = { height: val } : self.dimensions['height'] = val
  end

  belongs_to :productable, :polymorphic => true
end


