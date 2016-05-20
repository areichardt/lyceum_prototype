Rails.application.routes.draw do
  devise_for :users
  
######################################################################### 

  get '/' => 'pages#home'
  get '/pages/:id' => 'pages#user_resources'
  # post '/pages/:id' => 'pages#pdf'
  
  
######################################################################### 

  get '/circles/new' => 'circles#new'
  get '/circles/:id' => 'circles#show'
  get '/circles/:id/edit' => 'circles#edit'
  patch '/circles/:id' => 'circles#update'
  post '/circles' => 'circles#create'
  post '/search_circles' => 'circles#search_for_circle'
  delete '/circles/:id' => 'circles#destroy'

#########################################################################  
  patch '/user_circles/:id' => 'user_circles#update'
  delete '/user_circles/:id' => 'user_circles#destroy'
#########################################################################

  get '/books/index' => 'books#index'
  get '/books/new' => 'books#new'
  get '/books/:id' => 'books#show'
  post '/books' => 'books#create'
  delete '/books/:id' => 'books#destroy'
  
#########################################################################  

  post '/discussion_comments' =>'discussion_comments#create'

#########################################################################   
  
  get '/comments/:id' => 'comments#show'
  post '/comments' => 'comments#create' 
  patch '/comments/:id' => 'comments#update'
  delete '/comments/:id' => 'comments#destroy'

######################################################################### 
  
  get '/private_discussion/:id' => 'question_answers#private_discussion'
  post '/questions' => 'question_answers#create'
  delete '/questions/:id' => 'question_answers#destroy'
######################################################################### 
  
  post '/answers' => 'answers#create'

#########################################################################

 post '/images' => 'images#create'
  

end