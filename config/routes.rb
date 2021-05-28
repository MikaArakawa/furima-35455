Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do #except destroy ◀差分反映のため追記
    resources :purchased_items, only: :create
  end
end
