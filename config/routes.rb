Rails.application.routes.draw do
  resources :boards
  resources :pins




  resources :pins do
  resources :comments   # leave this as is

    member do
      post '/repost' => 'pins#repost'
    end

    member do
      post '/like' => 'pins#like'
    end
  end
  get ':username' => 'users#show', as: 'user'

  devise_for :users
  root 'home#index'

end
