Rails.application.routes.draw do
  # Mount Rswag::Api::Engine and DeviseTokenAuth routes
  mount Rswag::Api::Engine => '/api-docs'
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    sessions: 'auth_token'
  }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show, :update, :destroy,:create]
    end
  end

end
