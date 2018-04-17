Rails.application.routes.draw do
  resources :articles

  post 'images/upload', to: 'images#upload'
  post 'images/delete', to: 'images#destroy'

  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
