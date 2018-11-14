Rails.application.routes.draw do
  resources :events
  devise_for :users
  resources :availabilities
   root to: "availabilities#index"
  resources :conversations do
    resources :messages
  end
  get 'pages/dashboard' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
