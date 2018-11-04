Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :publishers, only: [:index, :show]

  resources :publishers do
    resources :shops, only: [:index]
  end
  
  resources :shops, only: [:index, :show] # Note: shops#index will conditionally show publisher_shops_path if params[:publisher_id]

  resources :books, only: [:index]
end
