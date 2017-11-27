Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:index, :show, :create, :update, :destroy]
  
  resources :artworks, only: [:show, :create, :update, :destroy]
  
  resources :artwork_shares, only: [:create, :destroy]
  
  resources :users do 
    resources :artworks, only: [:index]
  end
  
  # get '/users', to: 'users#index' 
  # get '/users/:id', to: 'users#show'
  # get '/users', to: 'users#new', as: 'new_user'
  # get '/users/:id/edit', to: 'users#edit'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
end
