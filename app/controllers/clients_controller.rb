class ClientsController < ApplicationController
  before_action :set_client, only: ['show', 'update', 'edit']

  def first_access
    @client = Client.find_by_new_account_key params[:account_key]
    if @client
      redirect_to edit_client_path(@client)
    else
      render 'bad_account'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @client.update_attributes(client_params)
      redirect_to @client
    else
      redirect_to edit_client_path(@client)
    end
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:email, :password, :partner1, :partner2)
    end
end
