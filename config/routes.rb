Rails.application.routes.draw do

  root to: 'home#index'
  resources :au_pairs, only: [:index,:show] do
    resources :testimonials, only: [:new, :create]
  end
  
end
