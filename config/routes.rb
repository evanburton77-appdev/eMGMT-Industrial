Rails.application.routes.draw do
  resources :gpts
  get "/ai/:id" => "gpts#show", as: :ai_show
  resources :requests
  get "/messages/new/:id" => "messages#new", as: :new_message_user
  get "/requests/new/:id" => "requests#new", as: :new_request_user
  resources :messages
  resources :gigs
  devise_for :agents
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'gigs#index'
  get "/gigs_signed" => "gigs#index_signed", as: :index_signed
  get "/agent_messages" => "messages#agent_messages", as: :agent_message
  get "/agent_messages/:id" => "messages#agent_show", as: :agent_messages
  get ":id" => "users#show", as: :user
  get "agents/:id" => "agents#show", as: :agent
end
