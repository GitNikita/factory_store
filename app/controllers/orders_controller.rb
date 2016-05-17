class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @orders = Order.maked
  end

  def show
    @order = Order.find_by_id(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find_by_id(params[:id])
    @position = Position.new
  end

  def create
    @order = Order.new(order_params)
    @order.state = 'issue'
    if @order.save
      redirect_to edit_order_path(@order)
    else
      render 'new'
    end
  end

  def update
    @order = Order.find_by_id(params[:id])
    if @order.state == 'issue'
      @position = Position.new(position_params)
      @order.positions << @position

      if @order.save
        redirect_to edit_order_path(@order)
      else
        render 'edit'
      end
    end
  end

  def destroy
  end

  def make
    @order = Order.find_by_id(params[:id])
    @order.order_price = @order.calc_price
    @order.state = 'waiting'
    @order.maked_time = DateTime.now
    if @order.save
      redirect_to action: 'index'
    else
      render 'edit'
    end

  end

  private

  def order_params
    params.require(:order).permit(:manager_id, :client_id)
  end

  def position_params
    params.require(:position).permit(:product_id, :quantity)
  end
end
