Rails.application.routes.draw do
  resources :api, param: :name, only: :show
end
