Rails.application.routes.draw do
  get 'shopping/index'
  get 'chat/user_connected'
  get 'chat/incomming_message'
  root to: 'home#index'
  get 'product/:id/:title' => 'home#product'
  get 'shopping' => 'home#shopping'
end
