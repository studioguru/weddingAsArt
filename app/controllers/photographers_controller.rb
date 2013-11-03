class PhotographersController < ApplicationController
  include SessionsHelper

	def new
    @photographer = Photographer.new
	end

  def create
    @photographer = Photographer.new(photographer_params)
    @photographer.product_list = ProductList.new
    if @photographer.save
      sign_in @photographer
      redirect_to @photographer.product_list
    else
      render action: 'new'
    end
  end

  def update
  end

  private
    def photographer_params
      params.require(:photographer).permit(:email, :password)
    end
end
