# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(organisation_id: 1, name: "Test", email_address: "test@test.com", password: "password")
User.create(organisation_id: 2, name: "Test2", email_address: "Test2@Test.com", password: "password")
User.create(organisation_id: 3, name: "Test3", email_address: "test3@test.com", password: "password")
User.create(organisation_id: 4, name: "Test4", email_address: "test4@test.com", password: "password")

Organisation.create(name: "Costco", hourly_rate: 3.99)
Organisation.create(name: "Sams Club", hourly_rate: 20.99)
Organisation.create(name: "Walmart", hourly_rate: 17.58)
Organisation.create(name: "Target", hourly_rate: 30.00)
Organisation.create(name: "Meijers", hourly_rate: 25.00)

Shift.create(user_id: 1, start: Time.new(2019, 6, 6, 8, 0, 0, "+00:00") , finish: Time.new(2019, 6, 6, 13, 0, 0, "+00:00") , break_length: 30)
Shift.create(user_id: 1, start: Time.new(2019, 5, 12, 8, 0, 0, "+00:00") , finish: Time.new(2019, 5, 12, 15, 0, 0, "+00:00")  , break_length: 15)
Shift.create(user_id: 2, start: Time.new(2019, 11, 7, 8, 0, 0, "+00:00") , finish: Time.new(2019, 11, 7, 17, 0, 0, "+00:00") , break_length: 45)
Shift.create(user_id: 4, start: Time.new(2019, 8, 4, 8, 0, 0, "+00:00") , finish: Time.new(2019, 8, 4, 21, 0, 0, "+00:00") , break_length: 30)

puts "Done!"