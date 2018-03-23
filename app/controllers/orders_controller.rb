class OrdersController < ApplicationController
  before_action :order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
  end

  def create_meal_order
    order = Order.where(user: current_user)
    if order.empty?
      @order = Order.new(user: current_user, email: current_user.email, state: 'Pending')
    else
      @order = order.first
    end
    @meal = Meal.find(order_params["meal_id"].to_i)
    @order.meals << @meal
    if @order.save!
      redirect_to order_path(@order)
    else
      redirect_to order_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @order.update(order_params)
    redirect_to order_path(@order)
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def order
    @order ||= Order.find(params[:id])
  end

  def order_params
    params.require(:meal_order).permit(:meal_id)
  end
end
