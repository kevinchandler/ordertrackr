Rails.application.routes.draw do
  devise_for :drivers
  devise_for :agents
  root to: 'pages#home'
end
