Rails.application.routes.draw do
  get 'group/index'
  get 'group/show'
  get 'group/new'
  get 'group/create'
  get 'entity/index'
  get 'entity/show'
  get 'entity/new'
  get 'entity/create'
  get 'user/index'
  get 'user/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
