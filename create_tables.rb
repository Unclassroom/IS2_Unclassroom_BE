rails g model teacher cc:integer first_name:string last_name:string e_mail:string 
rails g model external_person cc:integer first_name:string last_name:string e_mail:string
rails g model manager cc:integer first_name:string last_name:string e_mail:string
rails g model student cc:integer first_name:string last_name:string e_mail:string
rails g model head_building cc:integer first_name:string last_name:string e_mail:string
rails g model faculty name:string
rails g model building head_building:references faculty:references
rails g model purpose_classroom name:string
rails g model type_classroom name:string
rails g model subject name:string
rails g model schedule day:integer begin_at:time end_at:time cyclic:boolean subject:references
rails g model request teacher:references purpose_classroom:references type_classroom:references external_person:references
rails g model request_alternative request:references
rails g model opinion schedule:references
rails g model reports description:string{500} schedule:references 
rails g model deparment faculty:references name:string teacher:references
rails g model schedule_request day:integer begin_at:time end_at:time cyclic:boolean request_alternatives:references
