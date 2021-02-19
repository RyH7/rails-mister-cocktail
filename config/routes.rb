Rails.application.routes.draw do
  get 'doses/new'
  get 'doses/create'
  resources :cocktails, only: [:index, :new, :create, :show] do |variable|
  resources :doses, only: [:new, :create]
 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
