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
    get 'customers/my_page' => 'customers#show'
    resources :customers, only: [:edit, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'

    resources :items, only: [:index, :show]
    resources :carts, only: [:index, :update, :destroy, :create]
    delete 'cart/destroy_all' => 'carts#destroy_all'
    resources :orders, only: [:index, :show, :new, :create]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    get 'about' => 'homes#about'
    resources :addresses, only: [:index, :create, :edit, :destroy, :update]
  end
  root 'homes#top'
end
