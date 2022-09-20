Rails.application.routes.draw do
  resources :dishes, only: [:show]
  
  resources :chefs, except: [:show], module: 'chef' do
    resources :ingredients, only: [:index]
  end

  resources :chefs, only: [:show]
end
