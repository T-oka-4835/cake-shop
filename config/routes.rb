Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  scope module: :public do
    get 'my_page' => 'customers#show'
    get 'edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw'
    
    
  end




  root 'homes#top'
  get 'about' => 'homes#about'
end
