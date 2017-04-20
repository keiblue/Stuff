Rails.application.routes.draw do
  resources :categories
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'info', to: 'welcome#info'
  get 'contact', to:'welcome#contact'
  get 'all',to: 'categories#all'
  get 'dashboard', to: 'welcome#dashboard'
  root 'welcome#index'
end
