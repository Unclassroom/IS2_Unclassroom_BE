require 'faker'

ClassroomEvent.destroy_all
Event.destroy_all
SpecificRequest.destroy_all
Specific.destroy_all
CyclicRequest.destroy_all
CyclicSchedule.destroy_all
ClassroomSchedule.destroy_all
Report.destroy_all
Opinion.destroy_all
RequestAlternative.destroy_all
Request.destroy_all
Deparment.destroy_all
Group.destroy_all
Classroom.destroy_all
Building.destroy_all
HeadBuilding.destroy_all
Student.destroy_all
Manager.destroy_all
ExternalPerson.destroy_all
Teacher.destroy_all
Subject.destroy_all
TypeClassroom.destroy_all
PurposeClassroom.destroy_all
Faculty.destroy_all


abort

20.times do |i|
    CyclicSchedule.create!(
        day: Random.rand(8),
        begin_at: Faker::Time.between(2.days.ago, Date.today, :morning),
        end_at: Faker::Time.between(2.days.ago, Date.today, :afternoon),
   ) 
end

50.times do |row|
        Subject.create!(
        name: Faker::Educator.unique.course, 
       # created_at: Faker::Date.backward(370),
       # updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
end

for i in Subject.all 
    for j in 1..3
        Group.create!(
            subject_id: i.id,
            number: j
        )
        end
end



50.times do |row|
    HeadBuilding.create!(
    first_name: Faker::GameOfThrones.character,
    last_name: Faker::GameOfThrones.character,

   # created_at: Faker::Date.backward(370),
   # updated_at: Faker::Date.between(1.year.ago, Date.today)
  )
end

p "buildings =D"


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

puts 'finished loading faculty data'

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

puts 'finished loading purpose_classroom data'

TypeClassroom.create(name: "salon de clase")
TypeClassroom.create(name: "laboratorio")
TypeClassroom.create(name: "auditorio")
TypeClassroom.create(name: "salon de clases con computadores")
TypeClassroom.create(name: "salon de clases tipo auditorio")
TypeClassroom.create(name: "cancha de futbol")
TypeClassroom.create(name: "cancha de baloncesto")
TypeClassroom.create(name: "estadio")

puts 'finished loading type_classroom data'





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

puts 'finished loading external people data'

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

puts 'finished loading manager data'

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

puts 'finished loading student data'


55.times do |row|
    HeadBuilding.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email, 
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
end

puts 'finished loading head building data'

