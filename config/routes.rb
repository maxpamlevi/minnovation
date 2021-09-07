Rails.application.routes.draw do
  root to: 'home#index'
  get 'product/:id/:title' => 'home#product'
  get 'shopping' => 'home#shopping'
end
