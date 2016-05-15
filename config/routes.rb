Rails.application.routes.draw do
  devise_for :users
  
  get '/' => 'pages#home'
  post '/pages/:id' => 'pages#new_pic'
  
  get '/circles/new' => 'circles#new'
  get '/circles/:id' => 'circles#show'
  patch '/circles/:id' => 'circles#update'
  get '/circles/:id/discussion' => 'circles#discussion'
  post '/circles' => 'circles#create'
  post '/search_circles' => 'circles#search_for_circle'
  
  
  get '/books/index' => 'books#index'
  get '/books/new' => 'books#new'
  get '/books/:id' => 'books#show'
  post '/books' => 'books#create'
  delete '/books/:id' => 'books#destroy'
  
  post '/discussion_comments' =>'discussion_comments#create'
  
  get '/comments/:id' => 'comments#show'
  post '/comments' => 'comments#create' 
  

 
  namespace :api do 
    get '/circles' => 'circles#index'
    get '/circles/:id' =>'circles#show'
    post '/circles' => 'circles#create'
    
    get '/comments' => 'circles#index'
    
  end 


end
