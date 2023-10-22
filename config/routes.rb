Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: 'items#index'
  get 'cards/new'

  resources :items, only:[:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :orders, only: [:index, :create]
    resources :cards, only: [:new, :create]
  end
end

