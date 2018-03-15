Rails.application.routes.draw do
  resources :opinions
  resources :classroom_schedules
  resources :classroom_events
  resources :reports
  resources :events
  resources :classrooms
  resources :specific_requests
  resources :cyclic_requests
  resources :request_alternatives
  resources :requests
  resources :specific_schedules
  resources :cyclic_schedules
  resources :head_buildings
  resources :students
  resources :managers
  resources :external_people
  resources :teachers
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html1
  resources :subjects
end
