
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

# init all again
bin/rails db:environment:set RAILS_ENV=development
rake db:drop:all
rake db:create
rake db:migrate

