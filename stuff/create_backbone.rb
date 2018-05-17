
## INDEPENDET TABLES

# abstract models
rails g scaffold faculty name:string -s
rails g scaffold purpose_classroom name:string -s
rails g scaffold type_classroom name:string -s
rails g scaffold subject name:string -s

# people 
rails g scaffold teacher cc:integer first_name:string last_name:string email:string  -s
rails g scaffold external_person cc:integer first_name:string last_name:string email:string -s
rails g scaffold manager cc:integer first_name:string last_name:string email:string -s
rails g scaffold student cc:integer first_name:string last_name:string email:string -s
rails g scaffold head_building cc:integer first_name:string last_name:string email:string -s

# dates an events
rails g scaffold event name:string description:string{200}  -s
rails g scaffold specific_schedule date:date begin_at:time end_at:time -s
rails g scaffold cyclic_schedule day:integer begin_at:time end_at:time -s

## DEPENDENT TABLES

rails g scaffold building name:string head_building:references faculty:references -s
rails g scaffold department faculty:references name:string teacher:references -s
rails g scaffold classroom type_classroom:references building:references department:references capacity:integer -s
rails g scaffold group subject:references number:integer  -s

rails g scaffold request teacher:references purpose_classroom:references type_classroom:references external_person:references state:string -s
rails g scaffold request_alternative request:references  -s
rails g migration add_request_alternative_to_request request_alternative:references -s

rails g scaffold cyclic_request request_alternative:references cyclic_schedule:references -s
rails g scaffold specific_request request_alternative:references specific_schedule:references -s

rails g scaffold report description:string{500} classroom:references  -s

rails g scaffold classroom_schedule classroom:references group:references cyclic_schedule:references -s
rails g scaffold opinion classroom_schedule:references student:references  -s

rails g scaffold classroom_event event:references specific_schedule:references classroom:references -s

rails g scaffold auto_request file
rails g scaffold auto_request_failed auto_request:references code group day time building classroom

rails g migration add_code_to_subject code -s

rails g migration remove_begin_at_from_specific_schedule 
rails g migration remove_end_at_from_specific_schedule 
rails g migration remove_begin_at_from_cyclic_schedule 
rails g migration remove_end_at_from_cyclic_schedule

rails g migration add_begin_at_hour_to_cyclic_schedule begin_at_hour:integer
rails g migration add_begin_at_minute_to_cyclic_schedule begin_at_minute:integer
rails g migration add_end_at_hour_to_cyclic_schedule end_at_hour:integer
rails g migration add_end_at_minute_to_cyclic_schedule end_at_minute:integer

rails g migration add_begin_at_hour_to_specific_schedule begin_at_hour:integer
rails g migration add_begin_at_minute_to_specific_schedule begin_at_minute:integer
rails g migration add_end_at_hour_to_specific_schedule end_at_hour:integer
rails g migration add_end_at_minute_to_specific_schedule end_at_minute:integer

rails g migration add_number_to_building number:integer
rails g migration add_number_to_classroom number:integer

rails g migration remove_classroom_schedule_id_from_opinion
rails g migration add_classroom_id_to_opinion classroom:references
rails g migration remove_cyclic_schedule_id_from_cyclic_request
rails g migration remove_specific_schedule_id_from_specific_request

rails g migration CreateJoinTableCyclicRequestCyclicSchedule cyclic_request cyclic_schedule
rails g migration CreateJoinTableSpecificRequestSpecificSchedule specific_request specific_schedule

rails g migration add_image_to_opinion image
rails g migration add_image_to_report image

rails g migration remove_student_id_from_opinion

rails g migration add_request_to_classroom_schedule request:references
rails g migration add_request_to_classroom_event request:references

# init all again
bin/rails db:environment:set RAILS_ENV=development
rake db:drop:all
rake db:create
rake db:migrate

