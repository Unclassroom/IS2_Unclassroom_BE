# independent tables
rails g scaffold faculty name:string
rails g scaffold building head_building:references faculty:references
rails g scaffold purpose_classroom name:string
rails g scaffold type_classroom name:string
rails g scaffold subject name:string
rails g scaffold event name:string description:string

# people
rails g scaffold teacher cc:integer first_name:string last_name:string email:string 
rails g scaffold external_person cc:integer first_name:string last_name:string email:string
rails g scaffold manager cc:integer first_name:string last_name:string email:string
rails g scaffold student cc:integer first_name:string last_name:string email:string
rails g scaffold head_building cc:integer first_name:string last_name:string email:string

#schedule

rails g scaffold cyclic_schedule day:integer begin_at:time end_at:time
rails g scaffold specific_schedule day:date begin_at:time end_at:time

#dependent tables
rails g scaffold group subject:references
rails g scaffold deparment faculty:references name:string teacher:references

rails g scaffold request teacher:references external_person:references purpose_classroom:references type_classroom:references day:date state:string accepted_alternative:boolean
rails g scaffold request_alternative request:references

rails g scaffold cyclic_request request_alternative:references cyclic_schedule:references
rails g scaffold specific_request request_alternative:references specific_schedule:references

rails g scaffold classroom type_classroom:references building:references deparment:references capacity:integer

rails g scaffold report description:string{500} classroom:references

rails g scaffold classroom_event event:references specific_schedule:references classroom:references

rails g scaffold classroom_schedule classroom:references group:references cyclic_schedule:references
rails g scaffold opinion student:references classroom_schedule:references description:string
