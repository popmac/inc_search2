Rails.application.routes.draw do
  resources :tools do
    collection do
      get 'search'
      get 'autocomplete_tool_name'
    end
  end
  resources :users
  resources :reviews
end
