class ProductsController < ApplicationController

	before_filter :find_product, only: [:edut, :update, :destroy]
	before_filter :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

	def index
		@products = Product.all
	end
	
	def expensive
		@products = Product.where("price > 1000")
		render "index"
	end
	
	def show
		unless @product
			render text: "Страница не найдена", status: 404
		end
	end
	
	def new
		@product = Product.new
	end
	
	def edit
	end
	
	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_path(@product)
		else
			render "new"
		end
	end
	
	def update
		@product.update_attributes(product_params)
		if @product.save
			redirect_to products_path(@product)
		else
			render "edit"
		end
	end
	
	def destroy
		if @product.destroy
			redirect_to action: "index"
		end
	end
	
	
	private
	
	def product_params
		params.require(:product).permit(:name, :type_of_product, :price, :description)
	end	
	
	private 
	
	def find_product
		@product = Product.find(params[:id])
	end
	
	def check_if_admin
		#render text: "Access denied", status: 403 unless params[:admin]
	end
	

end
