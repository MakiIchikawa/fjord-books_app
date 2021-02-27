Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_scope :user do
    get 'users/auth/github/callback' => 'users/omniauth_callbacks#github'
    put 'users', to: 'registrations#update'
  end
  devise_for :users
  resources :books
  resources :users, only: %i(index show)
end
