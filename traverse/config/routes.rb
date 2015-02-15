Rails.application.routes.draw do
  get 'welcome/index'


  resources :users

  resources :trips, except: [:new, :edit, :show] do
    resources :events, except: [:edit, :show]
  end

  get '/trips/:trip_id/events_by_tag', :to => 'events#tag'

  get '/trips/:trip_id/tags', :to => 'tags#index'
  post '/events/:event_id/tags', :to => 'tags#create'
  delete '/events/:event_id/tags/:id', :to => 'tags#destroy'

  post '/events/:event_id/places', :to => 'places#create'
  delete '/events/:event_id/places/:id', :to => 'places#destroy'

  post '/events/:event_id/photos', :to => 'photos#create'
  delete '/events/:event_id/photos/:id', :to => 'photos#destroy'

  # resources :trips do
  #   resources :events
  #   resources :tags
  # end

  # resources :events do
  #   resources :photos
  #   resources :places
  # end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

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
