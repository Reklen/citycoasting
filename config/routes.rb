Rails.application.routes.draw do
  
  #get 'cities/index' => "cities#index"

  #get 'cities/show'

  #get 'cities/:id', to: 'cities#show', as: 'cities'
  resources :cities
  resources :neighborhoods

  get 'profiles/show'

  resources :stamps do
    member { post :vote }
  end

  #User Follow routes
  post '/users/:id/follow', to: 'profiles#follow', as: 'follow_user'
  post '/users/:id/stop_follow', to: 'profiles#stop_follow', as: 'stop_follow_user'

#FB Login
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "user_registrations" }

  root "stamps#index"
  get "about" => "pages#about" # creates about_path


  get 'explore', to: 'stamps#explore', as: 'explore'

  # get 'explore/category/{:id}' to 'stamps#explore', as'explore'

  get 'explore/(:category_id)', to: 'stamps#explore', as: 'category_filter'

  get 'cities/(:id)/(:category_id)', to: 'cities#show', as: 'city_category_filter'


  get ':id', to: 'profiles#stamps', as: 'profile'
  get '(:id)/posts', to: 'profiles#posts', as: 'profile_post'
  get '(:id)/cities', to: 'profiles#cities', as: 'profile_cities'


  get "stamps/modal_signup" => 'stamps#modal_signup', :as => :modal_signup

resources :stamps do
  resources :comments
end

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
