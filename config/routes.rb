Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :drivers
  devise_for :agents
  resources :orders, param: :identifier
end
