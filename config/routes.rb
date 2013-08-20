Sabairean::Application.routes.draw do
  root to: 'pages#home'
  get 'about' => 'pages#about'
  get 'app' => 'pages#app'
  get 'contact' => 'pages#contact'

  devise_for :users
end
