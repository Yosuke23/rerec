Rails.application.routes.draw do

  get 'registers/create'
  get 'registers/destroy'
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
  resources :books, only: %i[index create show] do
  	collection do
     get :search
    end		
  end
end
