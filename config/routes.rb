Rails.application.routes.draw do
  root 'static_public#landing_page'
  get 'privacy', to: 'static_public#privacy'
  get 'terms', to: 'static_public#terms'
end
