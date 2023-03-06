Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :students
      post '/login', to: 'students#login'
      resources :instructors
    end
  end

  # Routing Guide  - https://guides.rubyonrails.org/routing.html
  # root "articles#index"
end
