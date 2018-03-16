# independent tables
rails g migration faculty name:string -s
rails g migration purpose_classroom name:string -s
rails g migration type_classroom name:string -s
rails g migration subject name:string -s


# people 
rails g migration teacher cc:integer first_name:string last_name:string email:string  -s
rails g migration external_person cc:integer first_name:string last_name:string email:string -s
rails g migration manager cc:integer first_name:string last_name:string email:string -s
rails g migration student cc:integer first_name:string last_name:string email:string -s
rails g migration head_building cc:integer first_name:string last_name:string email:string -s

#dependent tables

rails g migration building head_building:references faculty:references -s
rails g migration classroom type_classroom:references building:references deparment:references capacity:integer -s
rails g migration group subject:references number:integer  -s
rails g migration deparment faculty:references name:string teacher:references -s
rails g migration request teacher:references purpose_classroom:references type_classroom:references external_person:references state:string -s
rails g migration request_alternative request:references  -s
rails g migration add_request_alternative_to_request request_alternative:references -s
rails g migration opinion classroom_schedule:references student:references  -s
rails g migration reports description:string{500} classroom:references  -s

rails g migration cyclic_schedule day:integer begin_at:time end_at:time  -s
rails g migration classroom_schedule classroom:references group:references subject:references -s
rails g migration cyclic_request request_alternative:references cyclic_schedule:references -s
rails g migration specific date:date begin_at:time end_at:time -s
rails g migration specific_request request_alternative:references specific:references -s
rails g migration event name:string description:string{200}  -s
rails g migration classroom_event event:references specific:references classroom:references -s
