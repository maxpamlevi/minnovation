Rails.application.routes.draw do
  get 'shopping/index'
  get 'chat/user_connected'
  get 'chat/incomming_message'
  root to: 'home#index'
  get 'product/:id/:title' => 'home#product'
  get 'shopping' => 'home#shopping'
  get 'auction' => 'home#auction'
  get 'store' => 'home#store'
  get 'growth' => 'home#growth'
  get 'brand/:brand'   => 'home#brand'
  get 'auction'   => 'home#auction'
  get 'search'  => 'home#search' 
end
