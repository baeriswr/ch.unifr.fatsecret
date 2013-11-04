Rails3DeviseRspecCucumber::Application.routes.draw do
  post "/fatsecret", to: "apis#fatsecret"
  post "/users/:user_id/fatsecret", to: "apis#fatsecret", as: "fatsecret_auth"

  get "apis/fatsecret"

  match '/users/:user_id/api_tokens/new' => redirect('/auth/fatsecret?user_id=%{user_id}')
  get '/auth/fatsecret/callback', to: 'api_tokens#create'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  devise_for :users
  resources :users do
    resources :api_tokens
  end
end
