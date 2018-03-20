class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @meals = Meal.all
  end

  def new
    @meal_provider = MealProvider.find(params[:meal_provider_id])
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.meal_provider = MealProvider.find(params[:meal_provider_id])
    if @meal.save!
      redirect_to meal_provider_meal_path(@meal.meal_provider, @meal)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @meal.update(meal_params)
    redirect_to meal_provider_meal(@meal)
  end

  def destroy
    @meal.destroy
    redirect_to meals_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name,:description,:price, :photo)
  end
end
