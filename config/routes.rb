Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  get 'homes/before_signin' => 'homes#before_signin'
  get 'homes/before_signup' => 'homes#before_signup'

  devise_for :users, controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
 }
  resources :users, only: [:show, :edit, :update] do
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
  resources :searches, only: [:index]
  resources :contacts, only: [:new, :create]

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :play_lists, only: [:index, :edit, :update]
    put "/users/:id/hide" => "users#hide", as: 'users_hide'
    put "/users/:id/open" => "users#open", as: 'users_open'
  end
end
