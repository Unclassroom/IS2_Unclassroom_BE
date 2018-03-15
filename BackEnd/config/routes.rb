Rails.application.routes.draw do
  resources :head_buildings
  resources :students
  resources :managers
  resources :external_people
  resources :teachers
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html1
  resources :subjects
end
