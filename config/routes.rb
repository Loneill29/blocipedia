Rails.application.routes.draw do

  resources :charges, only: [:new, :create, :destroy]

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  devise_for :users
  
  get 'about' => 'welcome#about'
  root 'welcome#index'

end
