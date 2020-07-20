Rails.application.routes.draw do

  get 'third_registers/create'
  get 'third_registers/destroy'
  get 'second_registers/create'
  get 'second_registers/destroy'
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
  get '/impressions_page',   to: 'users#impressions_page'
  get  '/login',     to: 'sessions#new'
  post  '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'
  get  '/reading_books',  to:  'books#reading_books'
  get  '/readed_books',  to:  'books#readed_books'
  post  '/readed_books',  to:  'books#readed_books'
  get  '/want_books',  to:  'books#want_books'
  get  '/impressions_title',  to:  'impressions#impressions_title'
  post  '/impressions_title',  to:  'impressions#impressions_title'

  resources :users
  resources :impressions, only: %i[create destroy edit update]
  resources :registers, only: %i[create destroy]
  resources :second_registers, only: %i[create destroy]
  resources :third_registers, only: %i[create destroy]
  resources :books, only: %i[index create show] do
  	collection do
     get :search
    end		
  end
end
