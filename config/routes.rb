Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, only: [] do
    resources :users, only: [:index], module: :companies
  end

  resources :tweets, only: [:index]

  resources :users, param: :username, only: [:index, :show] do
    resources :tweets, only: [:index]
  end

  resources :users, only: [:index]

  resources :companies
end
