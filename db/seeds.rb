# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times { |index| Challenge.create(name: "Challenge#{index+1}") }

User.create(email: "testuser@email.com", password: "password", nickname: "IonicUser")
