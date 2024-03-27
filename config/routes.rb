Rails.application.routes.draw do
  devise_for :users
  get 'orders/index'
  get 'shared/_second-header'
  get 'items/index'
  root to: "items#index"
end
