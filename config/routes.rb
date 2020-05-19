Rails.application.routes.draw do

  get 'sessions/new'
  root 'home_pages#home'
  get '/about',   to: 'home_pages#about'
  get '/terms',     to: 'home_pages#terms'
  get '/privacy',  to: 'home_pages#privacy'
  get '/started_page',  to: 'home_pages#started_page'
  get '/signup',     to: 'users#new'
  post  '/signup',     to: 'users#create'
  get  '/login',     to: 'sessions#new'
  post  '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
