# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :unidade_medidas do
    member do
      get 'confirm_delete'
    end
  end

  resources :pedidos do
    member do
      get 'confirm_delete'
    end
  end

  resources :produtos do
    member do
      get 'confirm_delete'
    end
  end

  root 'home#index'

  resources :usuarios do
    member do
      get 'confirm_delete'
    end
  end

  resources :compras, only: [:index, :create]

  resource :user_sessions, only: [:create, :new, :destroy]
end
