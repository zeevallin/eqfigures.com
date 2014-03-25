Pony::Application.routes.draw do

  resources :characters, except: [:destroy], path: '/'
  resources :choice, only: [:create], path: '/'

end
