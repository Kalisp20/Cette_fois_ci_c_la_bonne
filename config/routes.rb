Rails.application.routes.draw do
  get 'gossip/show'
  get 'gossip/new'
  post 'gossip/create'
  get 'user/new'
  post 'user/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
