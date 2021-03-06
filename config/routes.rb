Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'publics/sessions',
    passwords:     'publics/passwords',
    registrations: 'publics/registrations'
  }

  scope module: :publics do
    patch 'customers/withdraw' => 'customers#withdraw'
    get 'customers/my_page' => 'customers#show'
    resources :customers, only: [:edit, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    resources :items, only: [:index, :show, :create]
    resources :carts, only: [:index, :update, :destroy, :create]
    delete 'cart/destroy_all' => 'carts#destroy_all'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:index, :show, :new, :create]
    get 'about' => 'homes#about'
    resources :addresses, only: [:index, :create, :edit, :destroy, :update]
  end

  namespace :admins do
    resources :items
    resources :genres, only: [:index, :new, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index]
  end

  root 'homes#top'
end
