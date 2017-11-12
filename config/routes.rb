Rails.application.routes.draw do
  scope module: :clearance do
    resources :passwords, only: %i(create new)
    resources :users, only: %i() do
      resource :password, controller: :passwords, only: %i(create edit update)
    end

    get "/sign_in", to: "sessions#new", as: :sign_in
    post "/sign_in", to: "sessions#create", as: :session

    get "/sign_up", to: "users#new", as: "sign_up"
    post "/sign_up", to: "users#create", as: :users

    delete "/sign_out", to: "sessions#destroy", as: "sign_out"
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'static_pages#landing'
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'bookmarks#index'
  end

  resources :bookmarks
  resources :tags, only: %i(index create)

  scope module: :static_pages do
    get 'bookmarklet'
    get 'landing'
  end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
