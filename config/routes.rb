Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/meetups' => 'meetups#index', as: :meetups
  get '/meetups/:id' => 'meetups#show', as: :meetup

  get '/about' => 'home#about'
  root to: 'home#index'
end
