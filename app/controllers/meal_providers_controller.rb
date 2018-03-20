class MealProvidersController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meal_providers = MealProvider.all
  end

  def new
    @meal_provider = MealProvider.new
  end

  def create
    @meal_provider = MealProvider.new(meal_provider_params)
    @meal_provider.user = current_user
    if @meal_provider.save!
      redirect_to meal_provider_meals(@meal_provider)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @meal_provider.update(meal_provider_params)
    redirect_to meal_provider_path(@meal_provider)
  end

  def destroy
    @meal_provider.destroy
    redirect_to meal_providers_path
  end

  private

  def set_meal
    @meal_provider = MealProvider.find(params[:id])
  end

  def meal_provider_params
    params.require(:meal_provider).permit(:name,:address,:category)
  end
end

