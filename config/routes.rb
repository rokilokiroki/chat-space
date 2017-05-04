Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  get 'messages' => 'messages#index'
  resources :groups
end
