Rails.application.routes.draw do
  resources :lists, only: [:index]
end
