Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
  end

  resources :users, :only => [:index, :show]

  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
