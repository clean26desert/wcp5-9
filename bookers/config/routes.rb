Rails.application.routes.draw do
  devise_for :users
  root 'root#top'
  get '/home/about' => 'home#about'
  # get '/top' => 'root#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :post_books, only: [:new, :create, :index, :show]
  resources :users, only: [:show, :index, :edit, :update]
end
