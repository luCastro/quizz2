Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resource :session, only: [:new, :create, :destroy]
  
  resources :uses, only: [:new, :create]
  
  resources :ideas do
    
    resources :reviews, only: [:create, :destroy]
    
  end
  
end
