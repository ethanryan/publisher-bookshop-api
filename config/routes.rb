Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :publishers, only: [:index, :show]
  resources :books, only: [:index]
  resources :shops, only: [:index, :show]
end
