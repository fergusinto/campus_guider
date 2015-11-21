Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  resources :stores do
    member do
      get "like", to: "stores#upvote"
      get "dislike", to: "stores#downvote"
    end
    resources :comments
  end
  #root 'stores#index'

  root 'static#index'
  as :user do
    get 'stores', :to => 'devise', :as => :user_root
  end
end
