Rails.application.routes.draw do

  get 'user/index'

  get 'user/new'

  get 'user/create'

  get 'user/show'

  get 'user/edit'

  get 'user/update'

  get 'user/destroy'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals
  resources :meal_providers
end
