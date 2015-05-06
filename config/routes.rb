Rails.application.routes.draw do
  root "lists#index"
  resources :lists
  resources :tasks, except: [:index, :show, :destroy]
  get "archived", to: "lists#archived"
  get "lists/:id/complete", to: "lists#complete", as: "complete"
  get "tasks/:id/change_status", to: "tasks#change_status"
  put "remove_file", to: "tasks#remove_file"
end
