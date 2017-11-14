Rails.application.routes.draw do
  scope module: :clearance do
    resources :passwords, only: %i[create new]
    resources :users, only: %i[] do
      resource :password, controller: :passwords, only: %i[create edit update]
    end

    get '/sign_in', to: 'sessions#new', as: :sign_in
    post '/sign_in', to: 'sessions#create', as: :session

    get '/sign_up', to: 'users#new', as: :sign_up
    post '/sign_up', to: 'users#create', as: :users

    delete '/sign_out', to: 'sessions#destroy', as: :sign_out
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'static_pages#landing'
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'bookmarks#index'
  end

  resources :bookmarks
  resources :tags, only: %i[index create show]

  namespace :bookmark do
    resource :url, only: %i[create]
  end

  scope module: :static_pages do
    get 'bookmarklet'
    get 'landing'
  end
end
