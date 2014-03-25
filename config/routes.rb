Pony::Application.routes.draw do

  root to: 'characters#index'

  get "/auth/:provider/callback", to: 'sessions#create'

  resource  :session, only: [:new], controller: :sessions, path_names: { :new => :login }, path: '/' do
    get :end, action: :destroy, on: :collection, path: '/logout'
  end

  resources :characters, path_names: { :new => :introduce },path: '/'
  resources :choice, only: [:create], path: '/'

end
