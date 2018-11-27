Rails.application.routes.draw do
  resources :events
  devise_for :users
  resources :availabilities do
  resources :requests
  end
 
  root to: "availabilities#index"
  resources :conversations do
  resources :messages
  end
  get 'layouts/application'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/pages/:page" => "pages#schedules"
  get "/pages/:page" => "pages#shift-exchange"
  get "/pages/:page" => "pages#messages"
  get "/pages/:page" => "pages#new-staff"
  get "/pages/:page" => "pages#schedules"
end
