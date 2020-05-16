Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :auths, only: [:create]

  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :contacts do
      # nested routes
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show], path: '/phones'

      resource :phone, only: [:create, :destroy, :update], path: '/phone'

      resource :address, path: '/address'
    end
  end

  api_version(:module => "V2", :path => {:value => "v2"}) do
    resources :contacts do
      # nested routes
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show], path: '/phones'

      resource :phone, only: [:create, :destroy, :update], path: '/phone'

      resource :address, path: '/address'
    end
  end
end
