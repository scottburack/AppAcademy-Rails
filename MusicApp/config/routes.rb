Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :new, :show, :destroy]

  resource :session, only: [:create, :destroy, :new]

  resources :bands do
    resources :albums, only: [:new, :create]
  end


  resources :albums, except: [:new, :create]
end
