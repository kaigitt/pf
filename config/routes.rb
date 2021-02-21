Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  get 'homes/before_signin' => 'homes#before_signin'
  get 'homes/before_signup' => 'homes#before_signup'
  get 'mypages/social' => 'mypages#social', as: 'social'
  get 'mypages/profile'=> 'mypages#profile', as: 'profile'
  get 'mypages/account'=> 'mypages#account', as: 'account'
  get 'mypages/resign'=> 'mypages#resign', as: 'resign'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only: [:show, :update, :destroy] do
    post 'follow/:id' => 'relationships#follow', as: 'follow'
    delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  end
  resources :play_lists, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :show, :edit, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
  get '/tags/autocomplete.json', to: 'play_lists#tagAutocomplete'
  resources :tag_maps, only: [:create, :destroy]
  resources :tags, only: [:create, :destroy]
  resources :play_list_songs, only: [:create, :destroy]
  resources :songs, only: [:create, :destroy]
  resources :notifications, only: [:index]
  delete '/notifications/destroy_all' => 'notifications#destroy_all', as: 'destroy_all_users_notifications'

  resources :searches, only: [:index]
  resources :contacts, only: [:new, :create]

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :play_lists, only: [:index, :edit, :update, :destroy]
    put "/users/:id/hide" => "users#hide", as: 'users_hide'
    put "/users/:id/open" => "users#open", as: 'users_open'
  end
end
