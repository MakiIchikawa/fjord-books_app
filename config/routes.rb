Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }
  root to: 'books#index'
  resources :books

  scope :users do
    resources :reports, only: [:index]
  end

  resources :users, only: [:show] do
    scope module: :users do
      resources :reports
    end
  end

  resources :users, only: [:show] do
    resources :reports, only: [:show] do
      scope module: :users do
        resources :comments
      end
    end
  end

  resources :books, only: [:show] do
    scope module: :users do
      resources :comments
    end
  end

  resources :users, only: %i[index show] do
    resource :relationships, only: %i[create destroy]
    scope module: :users do
      resources :followings, only: [:index]
      resources :followers, only: [:index]
    end
  end
end
