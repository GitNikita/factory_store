class ClientsController < ApplicationController
  before_action :find_client, only: [:edit, :update, :destroy]
  before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]
  before_filter :authenticate_user!
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
    render text: "Страница не найдена", status: 404 unless @client
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path(@client)
    else
      render 'new'
    end
  end

  def update
    @client.update_attributes(client_params)
    if @client.save
      redirect_to clients_path(@client)
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to action: 'index' if @client.destroy
  end

  private

  def client_params
    params.require(:client).permit(:name, :phone, :email)
  end

  def find_client
    @client = Client.find(params[:id])
  end

  def check_if_admin
    # render text: "Access denied", status: 403 unless params[:admin]
  end
end
