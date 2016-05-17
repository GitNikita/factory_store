class ManagersController < ApplicationController
  before_action :find_manager, only: [:edit, :update, :destroy]
  before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]
  before_filter :authenticate_user!

  def index
    @managers = Manager.all
  end

  def show
    @manager = Manager.find(params[:id])
    render text: "Страница не найдена", status: 404 unless @manager
  end

  def new
    @manager = Manager.new
  end

  def edit
    @manager = Manager.find(params[:id])
  end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save
      redirect_to managers_path(@manager)
    else
      render 'new'
    end
  end

  def update
    @manager.update_attributes(manager_params)
    if @manager.save
      redirect_to managers_path(@manager)
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to action: 'index' if @manager.destroy
  end

  private

  def manager_params
    params.require(:manager).permit(:name, :phone, :email)
  end

  def find_manager
    @manager = Manager.find(params[:id])
  end

  def check_if_admin
    # render text: "Access denied", status: 403 unless params[:admin]
  end
end
