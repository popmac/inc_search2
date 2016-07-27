Rails.application.routes.draw do
  resources :tools do
    collection do
      get 'search'
    end
  end
end
