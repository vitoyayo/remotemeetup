Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/meetups' => 'meetups#index'
  get '/meetups/:id' => 'meetups#show'

  get '/about' => 'home#about'
  root to: 'home#index'
end
