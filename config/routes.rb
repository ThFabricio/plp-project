Rails.application.routes.draw do
  resources :atividades
  root "pages#home"
  resources :lembretes
  resources :categoria
  resources :meta
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
