Rails.application.routes.draw do
  get '/checkout', to: 'checkout#show', as: :checkout
  match '/checkout/scan', to: 'checkout#scan', as: :scan, via: [:get,:post]
  get '/checkout/clear', to: 'checkout#clear', as: :clear

  root 'checkout#show'
end
