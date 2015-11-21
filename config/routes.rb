Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  resources :stores do
    resources :comments
  end
  root 'stores#index'
end
