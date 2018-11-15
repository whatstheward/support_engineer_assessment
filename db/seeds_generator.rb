# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'restcountry'

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

countries = Restcountry::Country.all.sample(50)

countries.each do |country|
  Country.create!(
    name: country.name,
    capital: country.capital,
    region: country.region,
    population: country.population,
    area: country.area
  )
end

Team.create( name: "CCR", floor: "22", features_shipped: rand(40..100), current_bugs: rand(0..40) )
Team.create( name: "HSA", floor: "23", features_shipped: rand(40..100), current_bugs: rand(0..40) )
Team.create( name: "DM", floor: "22", features_shipped: rand(40..100), current_bugs: rand(0..40) )
Team.create( name: "CZ9", floor: "22", features_shipped: rand(40..100), current_bugs: rand(0..40) )
Team.create( name: "LFE", floor: "24", features_shipped: rand(40..100), current_bugs: rand(0..40) )
Team.create( name: "LTT", floor: "22", features_shipped: rand(40..100), current_bugs: rand(0..40) )
Team.create( name: "CLD", floor: "22", features_shipped: rand(40..100), current_bugs: rand(0..40) )
Team.create( name: "SES", floor: "23", features_shipped: rand(40..100), current_bugs: rand(0..40) )
Team.create( name: "Dops", floor: "22", features_shipped: rand(40..100), current_bugs: rand(0..40) )

(1..200).each do |book|
  Book.create(title: Faker::Book.title, author: Faker::Book.author, publisher: Faker::Book.publisher, genre: Faker::Book.genre )
end

ProgrammingLanguage.create(name: "Ruby", category: "Object Oriented", date_of_birth: 1995, inventor: "Yukihiro Matsumoto")
ProgrammingLanguage.create(name: "Elixir", category: "Functional", date_of_birth: 2011, inventor: "José Valim")
ProgrammingLanguage.create(name: "JavaScript", category: "Prototype", date_of_birth: 1995, inventor: "Brendan Eich")
ProgrammingLanguage.create(name: "Java", category: "Object Oriented", date_of_birth: 1995, inventor: "James Gosling")
ProgrammingLanguage.create(name: "C#", category: "Object Oriented", date_of_birth: 2000, inventor: "Anders Hejlsberg")
ProgrammingLanguage.create(name: "F#", category: "Functional", date_of_birth: 2005, inventor: "Don Syme")
ProgrammingLanguage.create(name: "Haskell", category: "Functional", date_of_birth: 1990, inventor: "Lennart Augustsson")
ProgrammingLanguage.create(name: "Erlang", category: "Functional", date_of_birth: 1986, inventor: "Joe Armstrong")

(1..200).each do |person|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  eng = Engineer.new(
    first_name: first_name,
    last_name: last_name,
    age: rand(18..70),
    email: "#{first_name}.#{last_name}@salesloft.com",
  )
  eng.country = Country.all.sample
  eng.team = Team.all.sample
  eng.save!
end

Engineer.all.each do |engineer|
  languages = ProgrammingLanguage.all
  books = Book.all
  (1..rand(1..4)).each do |language|
    EngineerProgrammingLanguage.create(
      engineer: engineer,
      programming_language: languages.sample,
      proficency: rand(1..5),
      repositories: rand(1..100)
    )
  end
  (1..rand(1..10)).each do |book|
    Bookshelf.create(
      engineer: engineer,
      book: books.sample,
      rating: rand(1..100),
      times_read: rand(1..5)
    )
  end
end

system("rake db:seed:dump FILE=db/seeds.rb")
