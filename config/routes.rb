Rails.application.routes.draw do
  root 'home#index'
  get 'index' => 'home#index'
  post 'search' => 'home#search'
end
