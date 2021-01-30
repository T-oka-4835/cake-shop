Rails.application.routes.draw do
  devise_for :customers
  root 'homes#top'
end
