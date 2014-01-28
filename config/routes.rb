Blatter::Application.routes.draw do
  resources :blats
  root to: 'blats#index'
end
