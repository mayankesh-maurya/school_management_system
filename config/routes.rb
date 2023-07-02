Rails.application.routes.draw do
  devise_for :users
  devise_for :school_admins
  devise_for :students, controllers: {
    registrations: 'students/registrations'
  }
  resources :admins, controller: 'users'
  resources :schools do
    resources :school_admins
    resources :courses do
      resources :batches do
        resources :students do
          member do
            patch :approve
            patch :deny
            get :classmates
          end
          # patch :approve, on: :member
        end
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
