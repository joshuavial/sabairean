Sabairean::Application.routes.draw do
  root to: 'pages#home'
  get 'about' => 'pages#about', as: :about
  get 'app' => 'pages#app', as: :app

  devise_for :users
end
