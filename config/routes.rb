Rails.application.routes.draw do
  root "pages#home"

  get "/relatorios", to: "relatorios#index"
  get "/relatorios/1", to: "relatorios#relatorio1"
  get "/relatorios/2", to: "relatorios#relatorio2"
  get "/relatorios/3", to: "relatorios#relatorio3"
  get "/relatorios/4", to: "relatorios#relatorio4"
  get "/relatorios/5", to: "relatorios#relatorio5"
  get "/relatorios/6", to: "relatorios#relatorio6"

  resources :atividades
  resources :lembretes
  resources :categoria
  resources :meta
end
