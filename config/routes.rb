Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root to: 'home#index'
  resources :au_pairs, only: [:index, :new, :create, :show] do
    resources :testimonials, only: [:new, :create]
    resources :proposals, only: [:new, :create, :show]
  end
  
end
