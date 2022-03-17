Rails.application.routes.draw do
  get 'profiles/new'
  root 'top_pages#home'
  devise_for :users
  resources :users
  resources :rooms
  resources :reservations
  resources :profiles
  get 'search' => 'rooms#search'
  get 'area' => 'rooms#area'
end
