Rails.application.routes.draw do
  get 'shopping/index'
  get 'chat/user_connected'
  get 'chat/incomming_message'
  root to: 'home#index'
end
