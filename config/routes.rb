Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#home'

  get '/menu' => "static_pages#menu", as: "menu"
  get ':page' => "static_pages#show", as: "static_page"

end
