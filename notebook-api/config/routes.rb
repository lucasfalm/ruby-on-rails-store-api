Rails.application.routes.draw do

  resources :contacts do
    resource :kind, only: [:show], path: 'relationships/kind'

    resource :phones, only: [:show], path: '/phones'

    resource :phone, only: [:create, :destroy, :update], path: '/phone'

    resource :address, path: '/address'
  end
end
