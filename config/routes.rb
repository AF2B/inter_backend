Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :ongs, only: [:index, :create]
      resources :users, only: [:index, :create, :show]
      resources :auth, only: [:create]
    end
  end

  post '/api/v1/outofstock', to: 'api/v1/ongs#outofstock'
  get '/api/v1/list-outofstock', to: 'api/v1/ongs#list_out_of_stock'
end
