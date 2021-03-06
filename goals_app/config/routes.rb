Rails.application.routes.draw do
  get 'goals/new'
  get 'goals/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create]
  resource :session, only: [:destroy, :new, :create]
end
