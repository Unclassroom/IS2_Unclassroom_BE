rails g model teacher cc:string first_name:string last_name:string e_mail:string is_head_department:boolean 
rails g model external_person cc:string first_name:string last_name:string e_mail:string
rails g model manager cc:string first_name:string last_name:string e_mail:string
rails g model student cc:string first_name:string last_name:string e_mail:string
rails g model head_building cc:string first_name:string last_name:string e_mail:string
rails g model faculty name:string
rails g model building head_building_id:head_building faculty_id:faculty
rails g model purpose_classroom name:string
rails g model type_classroom name:string
rails g model subject name:string
rails g model schedule day:int{3} begin_at:time end_at:time cyclic:boolean subject_id:subject
rails g model request teacher_id:teacher purpose_classroom_id:purpose_classroom type_classroom_id:type_classroom external_person_id:external_person
rails g model request_alternative request_id:request
rails g model opinion schedule_id:schedule
rails g model reports description:string{500} schedule_id:schedule 
rails g model deparment faculty_id:faculty name:string teacher_id:teacher
rails g model schedule_request day:int{3} begin_at:time end_at:time cyclic:boolean request_alternatives_id:request_alternatives
rails g model classroom type_classroom_id:type_classroom purpose_classroom_id:purpose_classroom building_id:building deparment_id:deparment capacity:int schedule_id:schedule
