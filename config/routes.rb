Rails.application.routes.draw do
  resources :interventions
  resources :leads
  devise_for :users
  resources :quotes
  get 'website/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'website#index'
  
  get '/index', to: 'website#index'
  
  get '/residential', to: 'website#residential'

  get '/commercial', to: 'website#commercial'

  get '/quote', to: 'website#quote'

  get '/google', to: 'google#maps'

  post '/watson/greetings', to: 'watson#greetings'

  get '/intervention' , to: 'website#intervention'

  get '/interventions/building_fetch/:customer_id', to: 'interventions#building_fetch'

  get '/interventions/battery_fetch/:building_id', to: 'interventions#battery_fetch'

  get '/interventions/column_fetch/:battery_id', to: 'interventions#column_fetch'

  get '/interventions/elevator_fetch/:column_id', to: 'interventions#elevator_fetch'

  get 'interventions/new', to: 'website#interventions'

end

