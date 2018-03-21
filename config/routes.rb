Rails.application.routes.draw do

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :meal_providers do
    resources :meals
  end
  devise_for :users

end


#                  Prefix Verb   URI Pattern                                                Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                                   devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                                   devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                                  devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)                              devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                             devise/passwords#edit
#            user_password PATCH  /users/password(.:format)                                  devise/passwords#update
#                          PUT    /users/password(.:format)                                  devise/passwords#update
#                          POST   /users/password(.:format)                                  devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)                                    devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)                                   devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                                      devise/registrations#edit
#        user_registration PATCH  /users(.:format)                                           devise/registrations#update
#                          PUT    /users(.:format)                                           devise/registrations#update
#                          DELETE /users(.:format)                                           devise/registrations#destroy
#                          POST   /users(.:format)                                           devise/registrations#create
#                     root GET    /                                                          pages#home
#      meal_provider_meals GET    /meal_providers/:meal_provider_id/meals(.:format)          meals#index
#                          POST   /meal_providers/:meal_provider_id/meals(.:format)          meals#create
#   new_meal_provider_meal GET    /meal_providers/:meal_provider_id/meals/new(.:format)      meals#new
#  edit_meal_provider_meal GET    /meal_providers/:meal_provider_id/meals/:id/edit(.:format) meals#edit
#       meal_provider_meal GET    /meal_providers/:meal_provider_id/meals/:id(.:format)      meals#show
#                          PATCH  /meal_providers/:meal_provider_id/meals/:id(.:format)      meals#update
#                          PUT    /meal_providers/:meal_provider_id/meals/:id(.:format)      meals#update
#                          DELETE /meal_providers/:meal_provider_id/meals/:id(.:format)      meals#destroy
#           meal_providers GET    /meal_providers(.:format)                                  meal_providers#index
#                          POST   /meal_providers(.:format)                                  meal_providers#create
#        new_meal_provider GET    /meal_providers/new(.:format)                              meal_providers#new
#       edit_meal_provider GET    /meal_providers/:id/edit(.:format)                         meal_providers#edit
#            meal_provider GET    /meal_providers/:id(.:format)                              meal_providers#show
#                          PATCH  /meal_providers/:id(.:format)                              meal_providers#update
#                          PUT    /meal_providers/:id(.:format)                              meal_providers#update
#                          DELETE /meal_providers/:id(.:format)                              meal_providers#destroy
