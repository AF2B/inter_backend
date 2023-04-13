Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :donors, only: [:index, :create]
      resources :organizations, only: [:index, :create]
      resources :foodbanks, only: [:index, :create]
      resources :donations, only: [:index, :create]
      resources :volunteers, only: [:create]
      resources :users, only: [:create]
      resources :photos, only: [:create]
      resources :feedbacks, only: [:create]
      resources :auth, only: [:create]
    end
  end
end
