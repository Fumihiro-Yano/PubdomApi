Rails.application.routes.draw do
  
  namespace :admin, { format: 'json' }  do
    get 'signup' => 'users#new'
    get 'get_login_user' => 'sessions#get_login_user'
    resources :users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
