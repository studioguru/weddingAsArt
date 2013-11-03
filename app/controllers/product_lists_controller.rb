class ProductListsController < ApplicationController
  before_action :set_product_list, only: ['show']
  def show
    @product = Product.new
  end

  private
    def set_product_list
      @product_list = ProductList.find(params[:id])
    end
end
