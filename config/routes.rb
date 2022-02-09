Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users
  get 'home/about' => 'home#about', as: "about"


  resources :books, only: [:new, :create, :index, :show, :destroy]
  get "books/:id/edit" => "books#edit"
  post "books/:id/edit" => "books#edit", as:"edit_book"
  patch "books/:id" => "books#update", as:"update_book"
  delete "books/:id" => "books#destroy", as: "destroy_book"

  resources :users, only: [:show, :edit, :index, :update]
  end
