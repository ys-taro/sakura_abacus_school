Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root to: "homes#top"

  devise_for :admin, skip: [:password], controllers: {
    registrations: "admin/registrations",
    sessions: 'admin/sessions'
  }
  devise_for :master_accounts, controllers: {
    registrations: "master_accounts/registrations",
    sessions: 'master_accounts/sessions'
  }

  resources :contacts, only: [:create]
  resources :informations, only: [:index, :show]
  resources :students, only: [:index, :show] do
    resources :sakura_prints, only: [:show]
    resources :kentes, only: [:show]
    resources :rooms, only: [:index, :show]
  end



  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :rooms, only: [:index, :show]
    resources :informations, only: [:index, :create, :new, :show, :destroy]
    resources :contacts, only: [:index, :show]
    resources :students
    resources :sakura_prints
    resources :kentes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :master_accounts, only: [:index, :show] do
      resources :students, except: [:index, :show], only: [:new, :create]
    end
  end
end
