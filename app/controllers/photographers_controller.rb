class PhotographersController < ApplicationController
  before_action :set_photographer, only: [:update, :edit, :sign_out]
  before_action :user_is_photographer, only: [:update, :edit, :sign_out]

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

  def edit
  end

  def sign_out
    sign_out_current_user
    redirect_to root_path
  end

  private
    def photographer_params
      params.require(:photographer).permit(:email, :password)
    end

    def set_photographer
      @photographer = Photographer.find(params[:id])
    end

    def user_is_photographer
      unless current_user == @photographer
        redirect_to sessions[:return_to] || root_path
      end
    end
end
