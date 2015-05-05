Rails.application.routes.draw do
  resources :lists
  resources :tasks, except: [:index, :show, :destroy]
end
