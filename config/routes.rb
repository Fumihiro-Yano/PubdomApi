Rails.application.routes.draw do
  
  namespace :admin, { format: 'json' }  do
    get 'signup' => 'users#new'
    get 'login_user_info' => 'sessions#login_user_info'
    get 'remember' => 'sessions#remember'
    get 'authenticated_token' => 'sessions#authenticated_token'
    get 'forget_remember' => 'sessions#forget'
    resources :users
    resources :articles
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
