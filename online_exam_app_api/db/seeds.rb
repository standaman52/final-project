# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Test.create(
name: 'Final Test',
description: 'Angular Final',
numberofquestion: 10,
begindate: Faker::Date.forward(23),
enddate: Faker::Date.forward(23)
)
Question.create(
user_id: 1,
test_id: 1,
name: 'What is angular',
option1: 'Language',
option2: 'Not a language',
option3: 'food',
option4: 'A game',
correctanswer: 'Language',
score: 5
)
