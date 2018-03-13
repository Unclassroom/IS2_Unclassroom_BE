require 'faker'

Student.destroy_all
100.times do |row|
    Student.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        e_mail: Faker::Internet.email, 
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
    end

puts 'finished loading student data'

Teacher.destroy_all
  100.times do |row|
    Teacher.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        e_mail: Faker::Internet.email, 
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
        e_mail: Faker::Internet.email, 
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
  )
end

puts 'finished loading external people data'

HeadBuilding.destroy_all
55.times do |row|
    HeadBuilding.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        e_mail: Faker::Internet.email, 
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
end

puts 'finished loading head building data'

Manager.destroy_all
55.times do |row|
    Manager.create!(
        cc: Faker::Number.unique.number(8),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        e_mail: Faker::Internet.email, 
        #created_at: Faker::Date.backward(370),
        #updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
end

puts 'finished loading manager data'

Subject.destroy_all
100.times do |row|
        Subject.create!(
        name: Faker::Educator.course, 
       # created_at: Faker::Date.backward(370),
       # updated_at: Faker::Date.between(1.year.ago, Date.today)
      )
end

puts 'finished loading subject data'

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
100.times do |row|
    PurposeClassroom.create!(
    name: Faker::Types.string,)
  end

  puts 'finished loading purpose classroom data'

 
#  100.times do
#    movie = Movie.create(name: Faker::Book.title,
#                         director: Faker::Name.name,
#                         description: Faker::FamilyGuy.quote,
#                         year: rand(1920..2018),
#                         length: rand(80..240),
#                         format: formats[rand(formats.length)],
#                         genre: genres[rand(genres.length)],
#                         image: images[rand(images.length)],
#                         thumbnail: images[rand(images.length)])
#    if movie.persisted?
#      rand(1..10).times do
#        movie.comments.create(
#            author: Faker::Name.name,
#            title: Faker::Book.title,
#            content: Faker::FamilyGuy.quote,
#            rating: rand(1..5)
#        )
#      end
#    end
#    puts movie.inspect
#  end
  