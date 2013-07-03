QuanduOmeka::Application.routes.draw do

  get 'instances/thanks'

  resources :instances, only: [:new, :create]

  namespace :admin do
    resources :instances
  end

  root :to => 'instances#new'

end
