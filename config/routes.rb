Rails.application.routes.draw do


  get 'sessions/index'
  post '/sessions/', to: 'sessions#create'
  get 'sessions/show'
  get "/places/yelp"
  resources :places, only: [:index, :create, :show, :edit]
  namespace :api do
    namespace :v1 do
      resources :yelp_places, only:[:index]
      resources :users, only:[:index, :create, :show, :edit]

      get "/events/nearby"
      post "events/join_event"
      get '/events/comments'
      resources :events, only:[:index,:show, :create, :edit]
      resources :comments, only:[:index, :create, :show, :edit]
      resources :messages, only:[:index, :create, :show, :edit]
      # resources :, only:[:index, :create, :show, :edit]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
