Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#home'

  resources :orders, only: [:update, :index, :edit, :destroy]
  get 'validate_order/:id' => 'orders#validate', as: "validate_order"
  get 'order/success' => 'orders#success', as: "order_success"
  get 'add_menu(/:id)' => 'orders#add_menu', as: "add_menu_to_order"

  get ':page' => "static_pages#show", as: "static_page"

end
