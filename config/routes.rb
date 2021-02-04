Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  devise_scope :user do
    get 'users/auth/github/callback' => 'users/omniauth_callbacks#github'
  end
  resources :books
  resources :users, only: %i(index show)
end
