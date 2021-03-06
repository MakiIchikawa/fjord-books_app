Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)
  resources :relationships, only: %i[destroy create]
  get 'users/:id/followers', to: 'followers#show', as: 'show_followers'
  get 'users/:id/followings', to: 'followings#show', as: 'show_followings'
end
