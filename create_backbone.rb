# independent tables
rails g scaffold faculty name:string
rails g scaffold building head_building:references faculty:references
rails g scaffold purpose_classroom name:string
rails g scaffold type_classroom name:string
rails g scaffold subject name:string

# people
rails g scaffold teacher cc:integer first_name:string last_name:string email:string 
rails g scaffold external_person cc:integer first_name:string last_name:string email:string
rails g scaffold manager cc:integer first_name:string last_name:string email:string
rails g scaffold student cc:integer first_name:string last_name:string email:string
rails g scaffold head_building cc:integer first_name:string last_name:string email:string

#dependent tables
rails g scaffold group subject:references


rails g scaffold deparment faculty:references name:string teacher:references
rails g scaffold schedule day:integer begin_at:time end_at:time cyclic:boolean subject:references
rails g scaffold request teacher:references purpose_classroom:references type_classroom:references external_person:references
rails g scaffold request_alternative request:references
rails g scaffold opinion schedule:references
rails g scaffold reports description:string{500} schedule:references 
rails g scaffold schedule_request day:integer begin_at:time end_at:time cyclic:boolean request_alternatives:references
