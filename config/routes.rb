Rails.application.routes.draw do
  devise_for :users
  

  devise_scope :user do
      root to: 'devise/sessions#index'
  end
  
  resources :user do
    resources :group 
    resources :entity
    resources :group_entity
  end

  # Routes
  # get 'splash_screen/index'
  # get 'group_entity/index'
  # get 'group_entity/show'
  # get 'group_entity/new'
  # get 'group/index'
  # get 'group/show'
  # get 'group/new'
  # get 'group/create'
  # get 'entity/index'
  # get 'entity/show'
  # get 'entity/new'
  # get 'entity/create'
  # get 'user/index'
  # get 'user/show'

end
