Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :drivers
  devise_for :agents, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :orders, param: :identifier
end
