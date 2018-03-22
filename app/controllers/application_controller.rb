class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :set_user_order


  # def set_user_order
  #   @user_order = current_user.orders
  # end
end
