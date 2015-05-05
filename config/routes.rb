Rails.application.routes.draw do
  root "lists#index"
  resources :lists
  resources :tasks, except: [:index, :show, :destroy]
  get "archived", to: "lists#archived"
end
