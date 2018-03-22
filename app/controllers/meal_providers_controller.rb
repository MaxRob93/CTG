class MealProvidersController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :destroy]

  def index
    if params[:query].nil?
     @meal_providers = MealProvider.where.not(latitude: nil, longitude: nil)
     @meal_provider = MealProvider.new
     @markers = @meal_providers.map do |meal_provider|
     {
       lat: meal_provider.latitude,
       lng: meal_provider.longitude#,
       # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
     }
   end
   else
    @meal_providers = MealProvider.search_req(params[:query])
    @meal_provider = MealProvider.new

     @markers = @meal_providers.map do |meal_provider|
     {
       lat: meal_provider.latitude,
       lng: meal_provider.longitude#,
       # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
     }
    end
   end
  end

  def new
    @meal_provider = MealProvider.new
  end

  def create
    @meal_provider = MealProvider.new(meal_provider_params)
    @meal_provider.user = current_user
    if @meal_provider.save!
      redirect_to meal_provider_path(@meal_provider)
    else
      render :new
    end
  end

  def show
    @new_meal = Meal.new
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
    params.require(:meal_provider).permit(:name,:address,:category,:photo)
  end
end
