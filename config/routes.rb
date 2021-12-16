Rails.application.routes.draw do
  resources :doctors, only: [:index, :show, :post]
  resources :appointments, only: [:show, :new, :destroy]
end
