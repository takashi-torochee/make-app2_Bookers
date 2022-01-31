Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'postimages/new'
  get 'postimages/index'
  get 'postimages/show'
  get 'postimages/edit'
  root to: 'homes#top'
  devise_for :users
  end
