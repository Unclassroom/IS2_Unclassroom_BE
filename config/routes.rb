# == Route Map
#
#               Prefix Verb   URI Pattern                         Controller#Action
#                 root GET    /                                   home#index
#                 auth GET    /auth(.:format)                     home#auth
#           user_token POST   /user_token(.:format)               user_token#create
#                users GET    /users(.:format)                    users#index
#        users_current GET    /users/current(.:format)            users#current
#         users_create POST   /users/create(.:format)             users#create
#                      PATCH  /user/:id(.:format)                 users#update
#                      DELETE /user/:id(.:format)                 users#destroy
#                      GET    /users(.:format)                    users#index
#                      GET    /users/current(.:format)            users#current
#                      POST   /users/create(.:format)             users#create
#                      PATCH  /user/:id(.:format)                 users#update
#                      DELETE /user/:id(.:format)                 users#destroy
#    social_auth_index GET    /social_auth(.:format)              social_auth#index
#                      POST   /social_auth(.:format)              social_auth#create
#          social_auth GET    /social_auth/:id(.:format)          social_auth#show
#                      PATCH  /social_auth/:id(.:format)          social_auth#update
#                      PUT    /social_auth/:id(.:format)          social_auth#update
#                      DELETE /social_auth/:id(.:format)          social_auth#destroy
#          departments GET    /departments(.:format)              departments#index
#                      POST   /departments(.:format)              departments#create
#           department GET    /departments/:id(.:format)          departments#show
#                      PATCH  /departments/:id(.:format)          departments#update
#                      PUT    /departments/:id(.:format)          departments#update
#                      DELETE /departments/:id(.:format)          departments#destroy
#              reports GET    /reports(.:format)                  reports#index
#                      POST   /reports(.:format)                  reports#create
#               report GET    /reports/:id(.:format)              reports#show
#                      PATCH  /reports/:id(.:format)              reports#update
#                      PUT    /reports/:id(.:format)              reports#update
#                      DELETE /reports/:id(.:format)              reports#destroy
#     classroom_events GET    /classroom_events(.:format)         classroom_events#index
#                      POST   /classroom_events(.:format)         classroom_events#create
#      classroom_event GET    /classroom_events/:id(.:format)     classroom_events#show
#                      PATCH  /classroom_events/:id(.:format)     classroom_events#update
#                      PUT    /classroom_events/:id(.:format)     classroom_events#update
#                      DELETE /classroom_events/:id(.:format)     classroom_events#destroy
#               events GET    /events(.:format)                   events#index
#                      POST   /events(.:format)                   events#create
#                event GET    /events/:id(.:format)               events#show
#                      PATCH  /events/:id(.:format)               events#update
#                      PUT    /events/:id(.:format)               events#update
#                      DELETE /events/:id(.:format)               events#destroy
#             opinions GET    /opinions(.:format)                 opinions#index
#                      POST   /opinions(.:format)                 opinions#create
#              opinion GET    /opinions/:id(.:format)             opinions#show
#                      PATCH  /opinions/:id(.:format)             opinions#update
#                      PUT    /opinions/:id(.:format)             opinions#update
#                      DELETE /opinions/:id(.:format)             opinions#destroy
#    specific_requests GET    /specific_requests(.:format)        specific_requests#index
#                      POST   /specific_requests(.:format)        specific_requests#create
#     specific_request GET    /specific_requests/:id(.:format)    specific_requests#show
#                      PATCH  /specific_requests/:id(.:format)    specific_requests#update
#                      PUT    /specific_requests/:id(.:format)    specific_requests#update
#                      DELETE /specific_requests/:id(.:format)    specific_requests#destroy
#   specific_schedules GET    /specific_schedules(.:format)       specific_schedules#index
#                      POST   /specific_schedules(.:format)       specific_schedules#create
#    specific_schedule GET    /specific_schedules/:id(.:format)   specific_schedules#show
#                      PATCH  /specific_schedules/:id(.:format)   specific_schedules#update
#                      PUT    /specific_schedules/:id(.:format)   specific_schedules#update
#                      DELETE /specific_schedules/:id(.:format)   specific_schedules#destroy
#      cyclic_requests GET    /cyclic_requests(.:format)          cyclic_requests#index
#                      POST   /cyclic_requests(.:format)          cyclic_requests#create
#       cyclic_request GET    /cyclic_requests/:id(.:format)      cyclic_requests#show
#                      PATCH  /cyclic_requests/:id(.:format)      cyclic_requests#update
#                      PUT    /cyclic_requests/:id(.:format)      cyclic_requests#update
#                      DELETE /cyclic_requests/:id(.:format)      cyclic_requests#destroy
#  classroom_schedules GET    /classroom_schedules(.:format)      classroom_schedules#index
#                      POST   /classroom_schedules(.:format)      classroom_schedules#create
#   classroom_schedule GET    /classroom_schedules/:id(.:format)  classroom_schedules#show
#                      PATCH  /classroom_schedules/:id(.:format)  classroom_schedules#update
#                      PUT    /classroom_schedules/:id(.:format)  classroom_schedules#update
#                      DELETE /classroom_schedules/:id(.:format)  classroom_schedules#destroy
#     cyclic_schedules GET    /cyclic_schedules(.:format)         cyclic_schedules#index
#                      POST   /cyclic_schedules(.:format)         cyclic_schedules#create
#      cyclic_schedule GET    /cyclic_schedules/:id(.:format)     cyclic_schedules#show
#                      PATCH  /cyclic_schedules/:id(.:format)     cyclic_schedules#update
#                      PUT    /cyclic_schedules/:id(.:format)     cyclic_schedules#update
#                      DELETE /cyclic_schedules/:id(.:format)     cyclic_schedules#destroy
# request_alternatives GET    /request_alternatives(.:format)     request_alternatives#index
#                      POST   /request_alternatives(.:format)     request_alternatives#create
#  request_alternative GET    /request_alternatives/:id(.:format) request_alternatives#show
#                      PATCH  /request_alternatives/:id(.:format) request_alternatives#update
#                      PUT    /request_alternatives/:id(.:format) request_alternatives#update
#                      DELETE /request_alternatives/:id(.:format) request_alternatives#destroy
#             requests GET    /requests(.:format)                 requests#index
#                      POST   /requests(.:format)                 requests#create
#              request GET    /requests/:id(.:format)             requests#show
#                      PATCH  /requests/:id(.:format)             requests#update
#                      PUT    /requests/:id(.:format)             requests#update
#                      DELETE /requests/:id(.:format)             requests#destroy
#               groups GET    /groups(.:format)                   groups#index
#                      POST   /groups(.:format)                   groups#create
#                group GET    /groups/:id(.:format)               groups#show
#                      PATCH  /groups/:id(.:format)               groups#update
#                      PUT    /groups/:id(.:format)               groups#update
#                      DELETE /groups/:id(.:format)               groups#destroy
#           classrooms GET    /classrooms(.:format)               classrooms#index
#                      POST   /classrooms(.:format)               classrooms#create
#            classroom GET    /classrooms/:id(.:format)           classrooms#show
#                      PATCH  /classrooms/:id(.:format)           classrooms#update
#                      PUT    /classrooms/:id(.:format)           classrooms#update
#                      DELETE /classrooms/:id(.:format)           classrooms#destroy
#            buildings GET    /buildings(.:format)                buildings#index
#                      POST   /buildings(.:format)                buildings#create
#             building GET    /buildings/:id(.:format)            buildings#show
#                      PATCH  /buildings/:id(.:format)            buildings#update
#                      PUT    /buildings/:id(.:format)            buildings#update
#                      DELETE /buildings/:id(.:format)            buildings#destroy
#       head_buildings GET    /head_buildings(.:format)           head_buildings#index
#                      POST   /head_buildings(.:format)           head_buildings#create
#        head_building GET    /head_buildings/:id(.:format)       head_buildings#show
#                      PATCH  /head_buildings/:id(.:format)       head_buildings#update
#                      PUT    /head_buildings/:id(.:format)       head_buildings#update
#                      DELETE /head_buildings/:id(.:format)       head_buildings#destroy
#             students GET    /students(.:format)                 students#index
#                      POST   /students(.:format)                 students#create
#              student GET    /students/:id(.:format)             students#show
#                      PATCH  /students/:id(.:format)             students#update
#                      PUT    /students/:id(.:format)             students#update
#                      DELETE /students/:id(.:format)             students#destroy
#             managers GET    /managers(.:format)                 managers#index
#                      POST   /managers(.:format)                 managers#create
#              manager GET    /managers/:id(.:format)             managers#show
#                      PATCH  /managers/:id(.:format)             managers#update
#                      PUT    /managers/:id(.:format)             managers#update
#                      DELETE /managers/:id(.:format)             managers#destroy
#      external_people GET    /external_people(.:format)          external_people#index
#                      POST   /external_people(.:format)          external_people#create
#      external_person GET    /external_people/:id(.:format)      external_people#show
#                      PATCH  /external_people/:id(.:format)      external_people#update
#                      PUT    /external_people/:id(.:format)      external_people#update
#                      DELETE /external_people/:id(.:format)      external_people#destroy
#             teachers GET    /teachers(.:format)                 teachers#index
#                      POST   /teachers(.:format)                 teachers#create
#              teacher GET    /teachers/:id(.:format)             teachers#show
#                      PATCH  /teachers/:id(.:format)             teachers#update
#                      PUT    /teachers/:id(.:format)             teachers#update
#                      DELETE /teachers/:id(.:format)             teachers#destroy
#             subjects GET    /subjects(.:format)                 subjects#index
#                      POST   /subjects(.:format)                 subjects#create
#              subject GET    /subjects/:id(.:format)             subjects#show
#                      PATCH  /subjects/:id(.:format)             subjects#update
#                      PUT    /subjects/:id(.:format)             subjects#update
#                      DELETE /subjects/:id(.:format)             subjects#destroy
#      type_classrooms GET    /type_classrooms(.:format)          type_classrooms#index
#                      POST   /type_classrooms(.:format)          type_classrooms#create
#       type_classroom GET    /type_classrooms/:id(.:format)      type_classrooms#show
#                      PATCH  /type_classrooms/:id(.:format)      type_classrooms#update
#                      PUT    /type_classrooms/:id(.:format)      type_classrooms#update
#                      DELETE /type_classrooms/:id(.:format)      type_classrooms#destroy
#   purpose_classrooms GET    /purpose_classrooms(.:format)       purpose_classrooms#index
#                      POST   /purpose_classrooms(.:format)       purpose_classrooms#create
#    purpose_classroom GET    /purpose_classrooms/:id(.:format)   purpose_classrooms#show
#                      PATCH  /purpose_classrooms/:id(.:format)   purpose_classrooms#update
#                      PUT    /purpose_classrooms/:id(.:format)   purpose_classrooms#update
#                      DELETE /purpose_classrooms/:id(.:format)   purpose_classrooms#destroy
#            faculties GET    /faculties(.:format)                faculties#index
#                      POST   /faculties(.:format)                faculties#create
#              faculty GET    /faculties/:id(.:format)            faculties#show
#                      PATCH  /faculties/:id(.:format)            faculties#update
#                      PUT    /faculties/:id(.:format)            faculties#update
#                      DELETE /faculties/:id(.:format)            faculties#destroy
#                      GET    /all_head_buildings(.:format)       head_buildings#all
#                      GET    /pdf_request/:id(.:format)          requests#get_pdf
# 

Rails.application.routes.draw do
  resources :auto_request_faileds
  resources :auto_requests
  # Add endpoints
  # Home controller routes.
  root   'home#index'
  get    'auth'            => 'home#auth'
    
  # Get login token from Knock
  post   'user_token'      => 'user_token#create'
    
  # User actions
  get    '/users'          => 'users#index'
  get    '/users/current'  => 'users#current'
  post   '/users/create'   => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'
  
  resources :social_auth
  # resources :users
  resources :departments
  resources :reports
  resources :classroom_events
  resources :events
  resources :opinions
  resources :specific_requests
  resources :specific_schedules
  resources :cyclic_requests
  resources :classroom_schedules
  resources :cyclic_schedules
  resources :request_alternatives
  resources :requests
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
  
  get '/all_head_buildings(.:format)', to: 'head_buildings#all'
  get '/pdf_request/:id(.:format)', to: 'requests#get_pdf'
  get '/purpose_classrooms_no_paginate/(.:format)',  to: 'purpose_classrooms#index_no_paginate'
  get '/type_classrooms_no_paginate/(.:format)',  to: 'type_classrooms#index_no_paginate'
  get '/faculties_no_paginate/(.:format)',  to: 'faculties#index_no_paginate'
  get '/groups_no_paginate/(.:format)',  to: 'groups#index_no_paginate'
  get '/subjects_no_paginate/(.:format)',  to: 'subjects#index_no_paginate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html1
end
