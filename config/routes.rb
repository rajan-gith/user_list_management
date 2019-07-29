Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get 'excel/users', to: 'users#excel', as: 'users_excel'
end
