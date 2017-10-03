Rails.application.routes.draw do

  mount ActionCable.server, at: "/cable"

  get 'sms/send_messages'
  resources :user

  patch 'update/:id', to: "user#update"

  get 'user/destroy'

  root 'pages#home'

  get 'dashboard', to: "dashboard#index"

  get 'dashboard/uploads'

  get 'account', to: "dashboard#account"

  post "/send_message", to: "sms#send_messages"

  post 'newphone', to: "available_phone_number#available_phones"

  post '/signin', to: 'sessions#create'

  post '/register', to: "registrations#create"

  post '/credoptions', to: "sms#twilio_api"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
