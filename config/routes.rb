Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedOut.new do
    root to: 'static_pages#landing'
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'bookmarks#index'
  end

  get '/sign_up', to: 'users#new', as: :sign_up
  post '/sign_up', to: 'users#create', as: :users

  scope module: :users do
    resources :activations, only: %i[show], param: :token, path: :user_activates
  end

  scope module: :clearance do
    resources :passwords, only: %i[create new]
    resources :users, only: %i[show edit update] do
      resource :password, controller: :passwords, only: %i[create edit update]
    end

    get '/sign_in', to: 'sessions#new', as: :sign_in
    post '/sign_in', to: 'sessions#create', as: :session

    delete '/sign_out', to: 'sessions#destroy', as: :sign_out
  end

  resources :bookmarks
  resources :tags, only: %i[index create show]

  namespace :bookmarks do
    resource :url, only: %i[create]
  end

  scope module: :static_pages do
    get 'bookmarklet'
    get 'landing'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
