Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :tools do
    collection do
      get 'search'
      get 'autocomplete_tool_name'
    end
  end
  resources :reviews do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
  root 'tools#index'
end
