Rails.application.routes.draw do
  
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

  root "home#index"
  get "about" => "pages#about" # creates about_path


  get 'explore', to: 'stamps#explore', as: 'explore'


  get 'explore/(:category_id)', to: 'stamps#explore', as: 'category_filter'
  get ':id', to: 'profiles#stamps', as: 'profile'
  get '(:id)/posts', to: 'profiles#posts', as: 'profile_post'
  get '(:id)/cities', to: 'profiles#cities', as: 'profile_cities'


  get "stamps/modal_signup" => 'stamps#modal_signup', :as => :modal_signup

resources :stamps do
  resources :comments
end

end
