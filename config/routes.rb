Rails.application.routes.draw do
  resources :messages
  resources :gigs
  devise_for :agents
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'gigs#index'
 
  get ":id" => "users#show", as: :user
end
