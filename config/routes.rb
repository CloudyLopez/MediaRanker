Rails.application.routes.draw do
  get 'works/index'
  root to: "works#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# root to: 'works#path'
  resources :works
end
