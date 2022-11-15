Rails.application.routes.draw do
  resources :users, only: [:show, :edit]
  resources :bookd, only: [:new, :index, :show, :edit, :create, :destroy, :update]

  devise_for :users
  root to: 'homes#top'

  get 'homes/about' ,as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
