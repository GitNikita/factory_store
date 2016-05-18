class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :destroy]
  before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]
  before_filter :authenticate_user!, except: [:show, :index]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    render text: "Страница не найдена", status: 404 unless @product
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path(@product)
    else
      render 'new'
    end
  end

  def update
    @product.update_attributes(product_params)
    if @product.save
      redirect_to products_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to action: 'index' if @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :type_of_product, :price, :description)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def check_if_admin
    # render text: "Access denied", status: 403 unless params[:admin]
  end
end
