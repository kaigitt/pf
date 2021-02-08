Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    post 'follow/:id' => 'relationships#follow', as: 'follow'
    delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  end
  resources :play_lists, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :show, :edit, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
  resources :tag_maps, only: [:create, :destroy]
  resources :tags, only: [:create, :destroy]
  resources :play_list_songs, only: [:create, :destroy]
  resources :songs, only: [:create, :destroy]
  resources :searches, only: [:index]

  namespace :admin do
  end
end
