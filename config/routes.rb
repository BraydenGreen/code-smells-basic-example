Rails.application.routes.draw do
  resources :owners
  resources :cats
  root 'owners#index'

  get 'owners/index'

  get 'owners/show'

  get 'owners/update'

  get 'owners/new'

 

end
