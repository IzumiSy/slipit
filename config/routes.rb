Rails.application.routes.draw do
  scope module: :clearance do
    resources :passwords, only: [:create, :new]
    resource :session, controller: :sessions, only: [:create]
    resources :users, only: [:create] do
      resource :password, controller: :passwords, only: [:create, :edit, :update]
    end

    get "/sign_in", to: "sessions#new", as: "sign_in"
    get "/sign_up", to: "users#new", as: "sign_up"
    delete "/sign_out", to: "sessions#destroy", as: "sign_out"
  end

  root 'bookmarks#index'

  resources :bookmarks

  scope module: :static_pages do
    get 'bookmarklet'
  end

  namespace :api do
    resource :bookmarks, only: %i(create)
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
