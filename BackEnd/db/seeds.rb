require 'faker'

ClassroomEvent.destroy_all #check
Event.destroy_all #check
SpecificRequest.destroy_all #check
SpecificSchedule.destroy_all #check
CyclicRequest.destroy_all # check
CyclicSchedule.destroy_all # check
ClassroomSchedule.destroy_all #check
Report.destroy_all #check
Opinion.destroy_all #check
RequestAlternative.destroy_all #check
Request.destroy_all #check
Department.destroy_all # check
Group.destroy_all # check
Classroom.destroy_all # check
HeadBuilding.destroy_all # check
Building.destroy_all # check
Student.destroy_all # check
Manager.destroy_all # check
ExternalPerson.destroy_all # check
Teacher.destroy_all #check
Subject.destroy_all # check
TypeClassroom.destroy_all # check
PurposeClassroom.destroy_all # check
Faculty.destroy_all # check

puts "loading faculties"
Faculty.create!(name: "Agronomia")
Faculty.create!(name: "Ciencias")
Faculty.create!(name: "Ciencias Económicas")
Faculty.create!(name: "Ciencias Humanas")
Faculty.create!(name: "Derecho, Ciencias Políticas y Sociales")
Faculty.create!(name: "Enfermería")
Faculty.create!(name: "Ingenieria")
Faculty.create!(name: "Medicina")
Faculty.create!(name: "Medicina Veterinaria y Zootecnia")
Faculty.create!(name: "Odontologia")
puts "done"

puts "loadingn Purpose clasroom"
PurposeClassroom.create(name: "clase academica")
PurposeClassroom.create(name: "conferencia academica")
PurposeClassroom.create(name: "coloquio academico")
PurposeClassroom.create(name: "reunion grupo de ivestigacion")
PurposeClassroom.create(name: "conferencia empresarial")
PurposeClassroom.create(name: "clase academica practica")
PurposeClassroom.create(name: "actividad ludica")
PurposeClassroom.create(name: "celebracion grados")
PurposeClassroom.create(name: "concierto")
PurposeClassroom.create(name: "evento cultural")
PurposeClassroom.create(name: "presentacion examenes")
PurposeClassroom.create(name: "practicas academicas")
puts "done"

puts 'loading type classrooms'
TypeClassroom.create(name: "salon de clase")
TypeClassroom.create(name: "laboratorio")
TypeClassroom.create(name: "auditorio")
TypeClassroom.create(name: "salon de clases con computadores")
TypeClassroom.create(name: "salon de clases tipo auditorio")
TypeClassroom.create(name: "cancha de futbol")
TypeClassroom.create(name: "cancha de baloncesto")
TypeClassroom.create(name: "estadio")
puts 'done'

puts 'loading subjects'
50.times do |row|
    Subject.create!(
    name: Faker::Educator.unique.course, 
   # created_at: Faker::Date.backward(370),
   # updated_at: Faker::Date.between(1.year.ago, Date.today)
  )
end
puts 'done'

puts 'lading external_people'
50.times do |row|
    ExternalPerson.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email, 
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
  )
end
puts 'done'

puts 'loading managers'
55.times do |row|
    Manager.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email, 
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
end
puts 'done'

puts 'loading teachers'
55.times do |row|
    Teacher.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email, 
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
end
puts 'done'

puts 'loading students'
100.times do |row|
    Student.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email, 
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
end
puts 'end'

puts 'loading buildings'
def create_Building(cnt = 20)
        for j in Faculty.all
            Building.create!(
                faculty_id: j.id,
                name: Faker::Educator.course
            )
        end
end
create_Building(30)
puts 'done'

puts 'loading headbuildings'
for i in Building.all
    HeadBuilding.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email, 
        building_id: i.id
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
end
puts 'done'


puts 'loading classrooms'
def create_Classroom(cnt = 20)
    for i in TypeClassroom.all
        for j in Building.all
            for k in Department.all
                Classroom.create!(
                    type_classroom_id: i.id,
                    building_id: j.id,
                    department_id: k.id,
                    capacity: Random.rand(200)
                )
                cnt -= 1
                if cnt == 0
                    return 
                end
            end
        end
    end
end
create_Classroom(50)
puts 'done'

puts 'loading subjects'
def create_Subject(cnt = 20)
    for i in Subject.all 
        for j in 1..cnt
            Group.create!(
                subject_id: i.id,
                number: j
            )
            end
    end
end
create_Subject(2)
puts 'done'

puts 'loading departments'
def create_Department(cnt = 20)
    for i in Faculty.all
        for j in Teacher.all
            Department.create!(
                faculty_id: i.id,
                teacher_id: j.id,
                name: Faker::Educator.campus
            )            
        end
    end
end
create_Department(20)
puts 'done'

puts 'loading requests'
def create_Request(cnt  = 20)
    for a in Teacher.all
        for b in ExternalPerson.all
            for c in PurposeClassroom.all
                for d in TypeClassroom.all
                    Request.create!(
                        teacher_id: a.id,
                        external_person_id: b.id,
                        purpose_classroom_id: c.id,
                        type_classroom_id: d.id,
                        state: "pending",
                    )
                    cnt -= 1
                    if cnt == 0
                        return 
                    end
                end
            end
        end
    end
end
create_Request(20)
puts 'done'

puts 'loading request alternatives'
def create_RequestAlternative(cnt = 20)
    for j in Request.all
        RequestAlternative.create!(
            request_id: j.id
            )
        cnt -= 1
        if cnt == 0
            return 
        end
    end
end
create_RequestAlternative(20)
puts 'done'

puts 'loading opinions'
def create_Opinion (cnt = 20)
    for i in Student.all
        for j in ClassroomSchedule.all
            Opinion.create!(
                student_id: i.id,
                classroom_schedule_id: j.id,
                description: "this is " + Faker::HowIMetYourMother.catch_phrase 
            )
            cnt -= 1
            if cnt == 0
                return 
            end
        end
    end
end
create_Opinion (20)
puts 'done'

puts 'loading reports'
def create_Report(cnt = 20)
    for i in Classroom.all
        Report.create!(
            description: "found " + Faker::DragonBall.character,
            classroom_id: i.id
        )
        cnt -= 1
        if cnt == 0
            return 
        end
    end
end
create_Report(20)
puts 'done'

puts 'loading classrooms schedules'
def create_ClassroomSchedule(cnt = 20)
    for a in Classroom.all 
        for b in Group.all
            for c in Subject
                for d in CyclicSchedule
                    ClassroomSchedule.create!(
                        classroom_id: a.id,
                        group_id: b.id,
                        subject_id: c.id,
                        cyclic_schedule_id: d.id
                    )

                    cnt -= 1
                    if cnt == 0
                        return 
                    end
                end
            end
        end
    end
end
create_ClassroomSchedule(20)
puts 'done'

puts 'loading cyclic schedules'
20.times do |i|
    CyclicSchedule.create!(
        day: Random.rand(8),
        begin_at: Faker::Time.between(2.days.ago, Date.today, :morning),
        end_at: Faker::Time.between(2.days.ago, Date.today, :afternoon),
   ) 
end
puts 'done'

puts 'loading cyclic requests'
def create_CyclicRequest(cnt = 20)
    for i in RequestAlternative.all
        for j in CyclicSchedule.all
            CyclicRequest.create(
                request_alternative_id: i.id,
                cyclic_schedule_id: j.id
            )
            cnt -= 1
            if cnt == 0
                return
            end 
        end
    end
end
create_CyclicRequest(20)
puts 'done'

puts 'loading specific_schedules'
def create_SpecificSchedule(cnt = 20)
    for i in 1..cnt
        SpecificSchedule.create!(
            date: Faker::Date.forward(23),
            begin_at: Faker::Time.between(2.days.ago, Date.today, :morning),
            end_at: Faker::Time.between(2.days.ago, Date.today, :afternoon),
  
        )
    end
end
create_SpecificSchedule(20);
puts 'done'

puts 'loading specific_requests'
def create_SpecificRequest(cnt = 20)
    for i in RequestAlternative.all
        for j in SpecificSchedule.all
            SpecificRequest.create!(
                request_alternative_id: i.id,
                specific_schedule_id: j.id
            )
            cnt -= 1
            if cnt == 0
                return
            end
        end
    end
end
create_SpecificRequest
puts 'done'

puts 'loading events'
def create_events(cnt = 20)
    Event.create!(name: "boring stuff", description:  "many people asking many stuff and things")
    Event.create!(name: "grados de colegio pepito", description:  "many people asking many stuff and things, and kids who are going to fail in live")
    Event.create!(name: "diplomado en data science", description:  "people learning about computer learning and stuff")
    Event.create!(name: "salida de campo", description:  "charla sobre cosas de animalitos")
    Event.create!(name: "coloquio de matematicas", description:  "gente muy ñoña hablando de mates")
    Event.create!(name: "huellas que inspiran", description:  "buuuuuuuuuuuuu")
    Event.create!(name: "Bogotá musical", description:  "una clase muy genial, concierto gratis :V")
    Event.create!(name: "no se", description:  "descripciones de aburiadsfjasñofjadsjfñads")
    Event.create!(name: "conferencia", description:  "viene el presidente quizás (?)")
    Event.create!(name: "cosas de rep. estudiantil", description:  "buuuuuu, vendidos, buuuuuuuu")
    Event.create!(name: "lab extra quimica", description:  "fluidos, lab de reposición por paro")
end
create_events(10)
puts 'done'

puts 'loading classrooms events'
def create_classroomEvents(cnt = 20)
    for i in Event.all
        for j in SpecificSchedule.all
            for k in Classroom.all
                ClassroomEvent.create!(
                    event_id: i.id,
                    specific_schedule_id: j.id,
                    classroom_id: k.id
                    )
                    cnt -= 1
                    if cnt == 0
                        return
                    end
            end
        end
    end
end
create_classroomEvents(25)
puts 'done'