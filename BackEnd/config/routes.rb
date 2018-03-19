Rails.application.routes.draw do
  resources :classroom_events
  resources :events
  resources :opinions
  resources :specific_requests
  resources :specifics
  resources :cyclic_requests
  resources :classroom_schedules
  resources :cyclic_schedules
  resources :request_alternatives
  resources :requests
  resources :deparments
  resources :groups
  resources :classrooms
  resources :buildings
  resources :head_buildings
  resources :students
  resources :managers
  resources :external_people
  resources :teachers
  resources :subjects
  resources :type_classrooms
  resources :purpose_classrooms
  resources :faculties
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html1
end
