Rails.application.routes.draw do
  # Backend
  namespace :api, format: :json do
    namespace :v1 do
      resources :products, only: %i[index]
    end
  end

  # Frontend
  root to: 'application#index'
  get '/*path', to: 'application#index', format: false
end
