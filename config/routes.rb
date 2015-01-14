Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", :registrations => "ex_devise" }

  # resources :users, except: [:new, :create]
  resources :events
  
  post "/events/participate" => "events#participate"
  post "/events/mark" => "events#mark_event"
  get "/users/:id" => "users#show", as: "user_show"
  post '/user/privatise' => "users#privatise"

  #  get "/auth/:provider/callback" => "callbacks#create"


  root to: "home#index"
end
