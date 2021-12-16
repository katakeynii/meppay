MepPay::Engine.routes.draw do
  resources :transactions, only: [:create]
end
