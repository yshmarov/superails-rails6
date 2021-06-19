Rails.application.routes.draw do
  devise_for :users, 
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                   confirmations: 'users/confirmations'
                 }
  root 'static_public#landing_page'
  get 'privacy', to: 'static_public#privacy'
  get 'terms', to: 'static_public#terms'
  get 'pricing', to: 'static_public#pricing'

  resources :posts

  post "checkout/create", to: "checkout#create", as: "checkout_create"
  resources :webhooks, only: [:create]

  resources :users, only: %i[index show]

end
