Rails.application.routes.draw do
  resources :deliveries, only: [:index, :create, :destroy]
  post 'routes/optimize', to: 'routes#optimize'
end
