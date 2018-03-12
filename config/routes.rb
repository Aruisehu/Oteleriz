Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#home'

  resources :orders, only: [:update, :index, :edit, :destroy]
  get 'order/:id/booking' => 'orders#booking', as: "order_booking"
  patch 'order/:id/booking' => 'orders#validate_booking'
  get 'order/success' => 'orders#success', as: "order_success"
  get 'order/not_available' => 'orders#not_available', as: "order_not_available"
  get 'order/access' => "orders#access"
  post 'order/access' => "orders#post_access"
  get 'add_menu(/:id)' => 'orders#add_menu', as: "add_menu_to_order"

  get ':page' => "static_pages#show", as: "static_page"

end
