Rails.application.routes.draw do
  root :to => "admin/dashboard#index"
  devise_for :user, :path => '', :path_names => {:sign_in => 'login', :sign_up => 'register'}
  resource :sessions, only: [:new, :create, :destroy]
  delete 'logout' => 'sessions#destroy'

  namespace :admin do
    resources :dashboard do
      collection do
        get "search"
        get "date_range"
      end
    end
    resources :transaction_types
    resources :credits
    resources :debits
    resources :transactions
    resources :reminders
  end

end
