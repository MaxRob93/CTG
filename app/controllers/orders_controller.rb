# class OrdersController < ApplicationController
#   def index
#     @orders = Order.all
#   end

#   def new
#     @order = Order.new
#   end

#   def create
#     @order = Order.find(params[:meal_order_id])
#     @meal_order = Meal.new(meal_order_params)
#     @meal_order.order = @order

#     if @meal_order.save!
#       redirect_to order_path(@order)
#     else
#       render "order/show"
#     end
#   end

#   def destroy
#     @meal_order = Meal.find(params[:id])
#     @order = @meal_order.order
#     @meal_order.destroy
#     redirect_to order_path(@order)
#   end
# end

#   private

#   def order_params
#     params.require(:order).permit(:meal_id, :order_id )
#   end
# end

class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    #@user = User.find(params[:user_id])
    @user = current_user
    @orders = current_user.orders
  end

  def new
    @user = current_user
    @order = Order.new
  end

  def create_meal_order
    order = Order.where(user: current_user)
    if order.empty?
      @order = Order.new(user: current_user, email: current_user.email)
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

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:meal_order).permit(:meal_id)
  end
end
