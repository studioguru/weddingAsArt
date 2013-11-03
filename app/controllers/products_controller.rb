class ProductsController < ApplicationController
  before_action :set_product_list, only: ['create', 'update']

  def new
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product_list.products << @product
        format.html { redirect_to @product_list }
        format.json { render json: @product }
      else
        format.html { redirect_to @product_list }
        format.json { render json: @product.errors }
      end
    end
  end

  def update
  end

  def show
  end

  private

    def set_product_list
      @product_list = ProductList.find(params[:product_list_id])
    end

    def product_params
      product_fields = params.require(:product).permit(:width, :height, :price, :type)
      product_fields[:price] = product_fields[:price].to_f
      product_fields
    end
end
