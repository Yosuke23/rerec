Rails.application.routes.draw do

  root 'home_pages#home'
  get '/about',   to: 'home_pages#about'
  get '/terms',     to: 'home_pages#terms'
  get '/privacy',  to: 'home_pages#privacy'
  get '/started_page',  to: 'home_pages#started_page'
  get '/signup',     to: 'users#new'
  post '/signup',     to: 'users#create'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
