Pony::Application.routes.draw do

  resources :characters, path_names: { :new => :introduce },path: '/'
  resources :choice, only: [:create], path: '/'

end
