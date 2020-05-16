Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :auths, only: [:create]

  api_version(:module => "V1", :header => {:name => "X-Version", :value => "1.0" }) do
    resources :contacts do
      # nested routes
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show], path: '/phones'

      resource :phone, only: [:create, :destroy, :update], path: '/phone'

      resource :address, path: '/address'
    end
  end

  api_version(:module => "V2", :header => {:name => "X-Version", :value => "2.0" })  do
    resources :contacts do
      # nested routes
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show], path: '/phones'

      resource :phone, only: [:create, :destroy, :update], path: '/phone'

      resource :address, path: '/address'
    end
  end
end
