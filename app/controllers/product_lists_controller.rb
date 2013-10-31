class ProductListsController < ApplicationController
  before_action :set_product_list, only: ['show']
  def show
    @product = Product.new
    @product_list.products << @product
    puts @product.inspect
  end

  private
    def set_product_list
      @product_list = ProductList.find(params[:id])
    end
end
