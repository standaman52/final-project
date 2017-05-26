Rails.application.routes.draw do

  resources :tests do
            resources :questions
            end
          resources :users do
        collection do
      post '/login', to: 'users#login'

  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
