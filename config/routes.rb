Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "follows" => "relationships#follows", as: "follows"
    get "followers" => "relationships#followers", as: "followers"
  end
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get 'search' => "searches#search", as: "search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
