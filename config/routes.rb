Rails.application.routes.draw do
  resources :lembretes
  resources :tarefas
  resources :categoria
  resources :meta
  resources :planners
  resources :usuarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
