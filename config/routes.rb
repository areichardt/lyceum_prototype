Rails.application.routes.draw do
  devise_for :users
  
  get '/' => 'pages#home'

  get '/circles/new' => 'circles#new'
  get '/circles/:id' => 'circles#show'
  get '/circles/:id/discussion' => 'circles#discussion'
  post '/circles' => 'circles#create'
  post '/search_circles' => 'circles#search_for_circle'
  patch '/circles/:id' => 'circles#update'
  
  get '/books/index' => 'books#index'
  get '/books/new' => 'books#new'
  get '/books/:id' => 'books#show'
  post '/books' => 'books#create'
  
  delete '/books/:id' => 'books#destroy'
  
  namespace :api do 
    get '/circles' => 'circles#index'
  end 


end
