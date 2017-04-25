Rails.application.routes.draw do
  resources :users
  resource :session
  resources :subs
  resources :posts, except: [:index]
  resources :comments, except: [:new]
  resources :posts, only: [:show] do
    resources :comments, only: [:new]
  end


end
