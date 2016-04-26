Rails.application.routes.draw do
  root :to => "admin/dashboard#index"
  devise_for :user, :path => '', :path_names => {:sign_in => 'login', :sign_up => 'register'}
  resource :sessions, only: [:new, :create, :destroy]
  delete 'logout' => 'sessions#destroy'

  namespace :admin do
    resources :dashboard
    resources :transaction_types
  end

end
