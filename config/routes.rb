Rails.application.routes.draw do
  resources :owners
  resources :cats
  
 # get '/home' , to: 'index#home', as: 'home'
 #    get '/show' , to: 'static_pages#about', as: 'show'
 #    get '/edit' , to: 'edit#owner', as: 'edit'
 #    get '/new' , to: 'static_pages#education', as: 'new'
 

end
