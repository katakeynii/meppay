MepPay::Engine.routes.draw do
  resources :transactions, only: [:create]
  resources :payment_notifications, path: 'payment-notifications', only: [:create]
end
