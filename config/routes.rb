Rails.application.routes.draw do

  resources :posts
  resources :users

  post '/signin' => 'sessions#create'
  post '/follow/:id' => 'users#follow'
  post '/unfollow/:id' => 'users#unfollow'
  get '/users/:id/following' => 'users#following'
  # post '/posts/:username' => 'posts#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
