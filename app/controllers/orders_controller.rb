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
