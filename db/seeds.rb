require 'faker'

puts "destruying"
AutoRequest.destroy_all 
ClassroomEvent.destroy_all #check
Opinion.destroy_all #check
ClassroomSchedule.destroy_all #check
Report.destroy_all #check
CyclicRequest.destroy_all # check
SpecificRequest.destroy_all #check
RequestAlternative.destroy_all #check
Request.destroy_all #check
Group.destroy_all # check
Classroom.destroy_all # check
Teacher.destroy_all #check
Department.destroy_all # check
Building.destroy_all # check
CyclicSchedule.destroy_all # check
SpecificSchedule.destroy_all #check
Event.destroy_all #check
HeadBuilding.destroy_all # check
Student.destroy_all # check
Manager.destroy_all # check
ExternalPerson.destroy_all # check
Subject.destroy_all # check
TypeClassroom.destroy_all # check
PurposeClassroom.destroy_all # check
Faculty.destroy_all # check
User.destroy_all
puts "done"

puts 'loading user'
# User.create(email: 'user1@example.com', password: "monkey67")
User.create(email: 'user1@example.com', username: 'user1', password: "Monkey123", role:"student")
userX = User.last
Student.create(first_name: "Lorena", last_name: "King", user_id: userX.id)
User.create(email: 'user2@example.com', username: 'user2', password: "Monkey123", role:"student")
userX = User.last
Student.create(first_name: "Carla", last_name: "Yang", user_id: userX.id)
User.create(email: 'user3@example.com', username: 'user3', password: "Monkey123", role:"student")
userX = User.last
Student.create(first_name: "Alejandra", last_name: "Lu", user_id: userX.id)
User.create(email: 'user4@example.com', username: 'user4', password: "Monkey123", role:"student")
userX = User.last
Student.create(first_name: "Felipe", last_name: "Calamaro", user_id: userX.id)
User.create(email: 'man1@example.com', username: 'man1', password: "Monkey123", role:"manager")
userX = User.last
Manager.create(first_name: "Patrick", last_name: "Gutierrez", user_id: userX.id)
User.create(email: 'man2@example.com', username: 'man2', password: "Monkey123", role:"manager")
userX = User.last
Manager.create(first_name: "Juan", last_name: "Quintero", user_id: userX.id)
puts 'done'

puts 'lading external_people'
10.times do |row|
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

puts 'loading headbuildings'
10.times do |row|
    HeadBuilding.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email, 
        #file: "/home/fffeelipe/Documents/"
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
end
puts 'done'

puts "loading faculties"
Faculty.create!(name: "Ingenieria")
for i in 1..4
Faculty.create!(name: "Agronomia" + i.to_s)
Faculty.create!(name: "Ciencias" + i.to_s)
Faculty.create!(name: "Ciencias Económicas" + i.to_s)
Faculty.create!(name: "Ciencias Humanas" + i.to_s)
Faculty.create!(name: "Derecho, Ciencias Políticas y Sociales" + i.to_s)
Faculty.create!(name: "Enfermería" + i.to_s)
Faculty.create!(name: "Ingenieria" + i.to_s)
Faculty.create!(name: "Medicina" + i.to_s)
Faculty.create!(name: "Medicina Veterinaria y Zootecnia" + i.to_s)
Faculty.create!(name: "Odontologia" + i.to_s)
puts "done"
end

puts "loadingn Purpose clasroom"
for i in 1..5
PurposeClassroom.create(name: "clase academica" + "  " + i.to_s)
PurposeClassroom.create(name: "conferencia academica" + "  " + i.to_s)
PurposeClassroom.create(name: "coloquio academico" + "  " + i.to_s)
PurposeClassroom.create(name: "reunion grupo de ivestigacion" + "  " + i.to_s)
PurposeClassroom.create(name: "conferencia empresarial" + "  " + i.to_s)
PurposeClassroom.create(name: "clase academica practica" + "  " + i.to_s)
PurposeClassroom.create(name: "actividad ludica" + "  " + i.to_s)
PurposeClassroom.create(name: "celebracion grados" + "  " + i.to_s)
PurposeClassroom.create(name: "concierto" + "  " + i.to_s)
PurposeClassroom.create(name: "evento cultural" + "  " + i.to_s)
PurposeClassroom.create(name: "presentacion examenes" + "  " + i.to_s)
PurposeClassroom.create(name: "practicas academicas" + "  " + i.to_s)
puts "done"
end

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
    code: Random.rand(1100000000)
  )
end
puts 'done'

puts 'loading events'

30.times do |i|
    Event.create!(name: Faker::HarryPotter.quote, description:  Faker::ChuckNorris.fact)
end

puts 'done'

puts 'loading specific_schedules'
def create_SpecificSchedule(cnt = 5)
    for i in 1..cnt
        SpecificSchedule.create!(
            date: Faker::Date.forward(23),
            begin_at_hour: Random.rand(23) ,
            end_at_minute: Random.rand(59),
            begin_at_minute: Random.rand(59),
            end_at_hour: Random.rand(23)
  
        )
    end
end
create_SpecificSchedule(5);
puts 'done'

puts 'loading cyclic schedules'
10.times do |i|
    CyclicSchedule.create!(
        day: Random.rand(8),
        begin_at_hour: Random.rand(23) ,
        end_at_minute: Random.rand(59),
        begin_at_minute: Random.rand(59),
        end_at_hour: Random.rand(23)
    ) 
    end
puts 'done'

puts 'loading buildings'
def create_Building(cnt = 5)
    for i in 0..5

            Building.create!(   
                head_building_id: HeadBuilding.find(i + HeadBuilding.first.id).id,
                faculty_id: Faculty.find(i + Faculty.first.id).id,
                name: Faker::Educator.campus,
                number: Random.rand(999)
            )
    end
end
create_Building(5)
puts 'done'

puts 'loading departments'
def create_Department(cnt = 20)
    for i in Faculty.all
        for j in 1..2 
        Department.create!(
            faculty_id: i.id,
            name: Faker::Educator.campus
        )
        end            
    end
end
create_Department(20)
puts 'done'
puts 'loading teachers'
User.create(email: 'tea1@example.com', username: 'tea1', password: "Monkey123", role:"teacher")
userX = User.last
depX = Department.first
Teacher.create(first_name: "Morfeo", last_name: "Lozano", user_id: userX.id, role: "head", department_id: depX.id)
User.create(email: 'tea2@example.com', username: 'tea2', password: "Monkey123", role:"teacher")
userX = User.last
depX = Department.last
Teacher.create(first_name: "Dimitri", last_name: "Kento", user_id: userX.id, role: "assistent", department_id: depX.id)
puts 'done'

puts 'loading classrooms'
def create_Classroom(cnt = 1)
    for i in TypeClassroom.take(2)
        for j in Building.take(2)
            for k in Department.take(2)
                Classroom.create!(
                    type_classroom_id: i.id,
                    building_id: j.id,
                    department_id: k.id,
                    capacity: Random.rand(200),
                    number: Random.rand(999)
                )
            end
        end
    end
end
create_Classroom(1)
puts 'done'

puts 'loading groups'
def create_Group(cnt = 1)
    teacher_id_count = Teacher.first.id
    for i in Subject.take(1)
        for j in 1..cnt
            Group.create!(
                subject_id: i.id,
                number: j,
                teacher_id: teacher_id_count
            )
            teacher_id_count += 1
            end
    end
end
create_Group(1)
puts 'done'

puts 'loading requests'
def create_Request(cnt  = 5)
    for a in Teacher.take(2)
        for b in ExternalPerson.take(2)
            for c in PurposeClassroom.take(2)
                for d in TypeClassroom.take(2)
                    Request.create!(
                        teacher_id: a.id,
                        external_person_id: b.id,
                        purpose_classroom_id: c.id,
                        type_classroom_id: d.id,
                        state: "pending",
                        motive: Faker::BackToTheFuture.quote
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
create_Request(5)
puts 'done'

puts 'loading request alternatives'
def create_RequestAlternative(cnt = 5)
    for j in Request.take(2)
        RequestAlternative.create!(
            request_id: j.id
            )
        cnt -= 1
        if cnt == 0
            return 
        end
    end
end
create_RequestAlternative(5)
puts 'done'

puts 'loading cyclic requests'
def create_CyclicRequest(cnt = 5)
    for i in RequestAlternative.take(2)
        for j in CyclicSchedule.take(2)
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
create_CyclicRequest(5)
puts 'done'

puts 'loading specific_requests'
def create_SpecificRequest(cnt = 5)
    for i in RequestAlternative.take(2)
        for j in SpecificSchedule.take(2)
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

puts 'loading reports'
def create_Report(cnt = 5)
    for i in Classroom.take(2)
        Report.create!(
            description: "found " + Faker::DragonBall.character,
            classroom_id: i.id
        )
    end
end
create_Report(5)
puts 'done'

puts 'loading classrooms schedules'
def create_ClassroomSchedule(cnt = 1)
    for a in Classroom.take(2)
        for b in Group.take(2)
            for c in Subject.take(2)
                for d in CyclicSchedule.take(2)
                    ClassroomSchedule.create!(
                        classroom_id: a.id,
                        group_id: b.id,
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
create_ClassroomSchedule(1)
puts 'done'

puts 'loading opinions'
def create_Opinion (cnt = 1)
    for i in Student.take(2)
        for j in Classroom.take(2)
            Opinion.create!(
                student_id: i.id,
                classroom_id: j.id,
                description: "this is " + Faker::HowIMetYourMother.catch_phrase 
            )
        end
    end
end
create_Opinion (1)
puts 'done'

puts 'loading classrooms events'
def create_classroomEvents(cnt = 3)
    for i in Event.take(2)
        for j in SpecificSchedule.take(2)
            for k in Classroom.take(2)
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
create_classroomEvents(2)
puts 'done'