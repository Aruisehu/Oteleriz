Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#home'

  resources :orders, only: [:update, :index, :edit, :destroy]
  get 'add_menu' => 'orders#add_menu', as: "add_menu_to_order"

  get ':page' => "static_pages#show", as: "static_page"

  post '/payments/lyfpay/:id' => "payments#lyfpay", as: "lyfpay_payment"
  get '/payments/success/:id' => "payments#success", as: "success_payment"
  get '/payments/error/:id' => "payments#error", as: "error_payment"
  get '/payments/success/:id' => "payments#cancel", as: "cancel_payment"
  get '/payments/callback/:id' => "payments#callback", as: "callback_payment"

end
