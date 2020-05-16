Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :auths, only: [:create]

  scope module: 'v1' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == "1" } do
      # nested routes
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show], path: '/phones'

      resource :phone, only: [:create, :destroy, :update], path: '/phone'

      resource :address, path: '/address'
    end
  end

  scope module: 'v2' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == "2" } do
      # nested routes
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show], path: '/phones'

      resource :phone, only: [:create, :destroy, :update], path: '/phone'

      resource :address, path: '/address'
    end
  end
end
