require 'faker'

### BASIC MODELS


Subject.destroy_all
50.times do |row|
        Subject.create!(
        name: Faker::Educator.unique.course, 
       # created_at: Faker::Date.backward(370),
       # updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
end

Faculty.destroy_all
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

PurposeClassroom.destroy_all
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

TypeClassroom.destroy_all
TypeClassroom.create(name: "salon de clase")
TypeClassroom.create(name: "laboratorio")
TypeClassroom.create(name: "auditorio")
TypeClassroom.create(name: "salon de clases con computadores")
TypeClassroom.create(name: "salon de clases tipo auditorio")
TypeClassroom.create(name: "cancha de futbol")
TypeClassroom.create(name: "cancha de baloncesto")
TypeClassroom.create(name: "estadio")

puts 'finished loading type_classroom data'

##### PEOPLE MODELS

Teacher.destroy_all
  100.times do |row|
    Teacher.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email, 
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
  end

puts 'finished loading teacher data'


ExternalPerson.destroy_all
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

Manager.destroy_all
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

Student.destroy_all
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


HeadBuilding.destroy_all
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


# Building.destroy_all
# 20.times do |row|
#     @HeadBuilding.Building.create!(
#         name: Faker::Educator.campus,
#     )
# end

# puts 'finished loading building'


##### SCHEDULES

# CyclicShedules.destroy_all
# 55.times do |row|
#       CyclicShedules.create!(
#         day: Faker::Number.unique.number(8),
#         begin_at: Faker::Name.first_name,
#         end_at: Faker::Name.last_name,
#         #created_at: Faker::Date.backward(370),
#         #updated_at: Faker::Date.between(1.year.ago, Date.today)
#       )
# end
