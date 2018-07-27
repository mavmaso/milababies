Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root to: 'home#index'
  get '/admin', to: 'home#admin', as: 'admin'
  get '/quemsomos', to: 'home#who', as: 'who'
  resources :au_pairs, only: [:index, :new, :create, :show] do
    resources :testimonials, only: [:new, :create]
    resources :proposals, only: [:new, :create, :show]
  end
  
end
