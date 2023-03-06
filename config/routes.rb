Rails.application.routes.draw do

  # API V1 LEARING MANAGEMENT SYSTEM
  namespace :api do
    namespace :v1 do
      resources :students
      post '/login', to: 'students#login'

      resources :instructors
      post '/instructor_login', to: 'instructors#login'

      resources :courses
      get '/tasks', to: 'courses#list_tasks'
      get '/check_tasks', to: 'courses#check_tasks'
    end
  end

  # Routing Guide  - https://guides.rubyonrails.org/routing.html
  # root "articles#index"
end
