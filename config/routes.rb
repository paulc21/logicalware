Rails.application.routes.draw do
  get '/checkout', to: 'checkout#show', as: :checkout
  match '/checkout/scan', to: 'checkout#scan', as: :scan, via: [:get,:post]
end
