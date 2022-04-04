Rails.application.routes.draw do
  root 'pages#home'

  get 'index', to: 'pages#index'

  resources :appointments

  devise_for :users
  devise_for :doctors, controllers: { registrations: 'doctors/registrations' }
  devise_for :patients, controllers: { registrations: 'patients/registrations' }

end
