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
      get '/generate_tasks_report', to: 'courses#generate_tasks_report'
    end
  end
end
