Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :admin do
        root 'base#home'

        get 'history' => 'orders#history'
        resources :dishes, :orders, :starters, :desserts, :services
        resources :meals do
            resources :services, only: [:new]
        end
    end

    namespace :api do
        get '/questions/last_meal' => 'questions#last_meal'
        resources :questions, only: [:create]
    end

    root 'application#home'

    devise_for :users, controllers: {
        sessions: "users/sessions",
        confirmations: "users/confirmations",
        registrations: "users/registrations",
        passwords: "users/passwords",
        omniauth_callbacks: 'users/omniauth_callbacks'
    }


    resources :orders, only: [:show, :index, :update, :edit, :destroy]
    get 'order/:id/booking' => 'orders#booking', as: "order_booking"
    patch 'order/:id/booking' => 'orders#validate_booking'
    get 'order/success' => 'orders#success', as: "order_success"
    get 'order/not_available' => 'orders#not_available', as: "order_not_available"
    get 'order/access' => "orders#access", as: "order_access"
    post 'order/access' => "orders#post_access"
    get 'add_menu(/:id)' => 'orders#add_menu', as: "add_menu_to_order"

    get ':page' => "static_pages#show", as: "static_page"

end
