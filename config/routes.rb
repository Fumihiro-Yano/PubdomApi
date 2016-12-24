Rails.application.routes.draw do
  
  namespace :admin, { format: 'json' }  do
    get 'signup' => 'users#new'
    get 'login_user_info' => 'sessions#login_user_info'
    get 'user_authenticate' => 'sessions#user_authenticate'
    resources :users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
