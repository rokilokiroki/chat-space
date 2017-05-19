Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, except: [:show] do
    resources :messages
  end
  get   'groups/search'  =>  'groups#search'
end
