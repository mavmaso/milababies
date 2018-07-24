Rails.application.routes.draw do

  root to: 'home#index'
  resources :au_pairs, only: [:index] do
    resources :proposals, only: [:new, :create, :show]
  end
  
end
