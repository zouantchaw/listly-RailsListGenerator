Rails.application.routes.draw do

  resources :tags
  get '/welcome', to: 'application#welcome', as: "welcome_page"
  root to: 'application#welcome'
  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end

  resources :cards

  resources :lists do
    resources :cards, only: [:new, :edit, :update, :destroy]
    resources :tags, only: [:new, :edit, :update, :destroy, :create]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks => 'callbacks'}

end
