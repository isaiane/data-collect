Rails.application.routes.draw do
  devise_for :users, path: "admin", controllers: { sessions: "admin/users/sessions", passwords: "admin/users/passwords", confirmations: "admin/users/confirmations" }, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  devise_scope :user do
    get "logout" => "devise/sessions#destroy"
    match 'admin' => 'admin/dashboard#index', via: :all
  end

  scope 'admin', :module => 'admin' do
    get 'developer/ui_elements' => 'developer#ui_elements'

    resources :dashboard, :resources, only: [:index]
    resources :records, except: [:edit]
    resources :professions, only: [:index, :destroy, :create] do
      collection do
        post 'update_row_order'
        put 'update_multiple'
      end
    end
    resources :users, except: [:edit] do
      collection do
        get 'edit_password'
        patch 'update_password'
      end
    end
    match '/users/:id', :to => 'users#destroy', :as => :user_destroy, via: :delete
  end
end
