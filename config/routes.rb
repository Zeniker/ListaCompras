Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :produtos do
    member do
      get 'confirm_delete'
    end
  end


  root 'home#index'
end
