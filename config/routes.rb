Rails.application.routes.draw do

  get 'sessions/index'
  post '/sessions/', to: 'sessions#create'
  get 'sessions/show'
  namespace :api do
    namespace :v1 do
      resources :users, only:[:index, :create, :show, :edit]
      get "/places/yelp"
      post "/places/yelpPost", to: "places#yelpPost"
      resources :places, only: [:index, :create, :show, :edit]

      # post "/places/yelpPost"
      resources :events, only:[:index, :create, :show, :edit]
      resources :comments, only:[:index, :create, :show, :edit]
      resources :messages, only:[:index, :create, :show, :edit]
      # resources :, only:[:index, :create, :show, :edit]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
