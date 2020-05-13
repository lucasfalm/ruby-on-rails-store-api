Rails.application.routes.draw do
  resources :kinds
  resources :phones

  resources :contacts do
    resource :kind, only: [:show], path: 'relationships/kind'

    resource :phones, only: [:show], path: '/phones'

    resource :address, except: [:create], path: '/address'
  end
end
