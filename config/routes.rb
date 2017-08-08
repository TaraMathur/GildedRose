Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'items/index'

  resources :items do
  	post :group_update, on: :collection
  	post :group_reload, on: :collection
  end

  root 'items#index'
end
