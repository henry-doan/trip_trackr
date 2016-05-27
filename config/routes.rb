Rails.application.routes.draw do
  root 'trips#index'
  resources :trips do
    resources :locations
  end
  resources :addresses
end
