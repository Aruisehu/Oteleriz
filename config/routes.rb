Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :admin do 
        root 'base#home'


        get 'dishes/new' => 'dishes#new'
        get 'dishes/:id' => 'dishes#edit'
        resources :dishes, :orders, :starters, :meals, :desserts
    end

    root 'application#home'

    devise_for :users, controllers: {
        sessions: 'admin/sessions'
    }

    resources :orders, only: [:update, :index, :edit, :destroy]
    get 'add_menu' => 'orders#add_menu', as: "add_menu_to_order"

    get ':page' => "static_pages#show", as: "static_page"

end
