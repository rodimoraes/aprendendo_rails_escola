Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :alunos
  resources :classes
  resources :ferramentas
  
  get 'dashboard/index'  
  root to: 'dashboard#index'


end
