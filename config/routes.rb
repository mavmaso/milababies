Rails.application.routes.draw do

  root to: 'home#index'
  resources :au_pairs, only: [:index]
  
end
