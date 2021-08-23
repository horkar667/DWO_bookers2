Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about"
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  resources :books, only: [:index,:show,:create,:destroy,:edit,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
