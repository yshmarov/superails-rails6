Rails.application.routes.draw do
  devise_for :users, 
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                   confirmations: 'users/confirmations'
                 }
  root 'static_public#landing_page'
  get 'privacy', to: 'static_public#privacy'
  get 'terms', to: 'static_public#terms'

  resources :posts

  resources :users, only: %i[index show]

end
