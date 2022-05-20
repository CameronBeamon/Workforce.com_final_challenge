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

Shift.create(user_id: 1, start: "11/23/2019", finish: "05/04/2020", break_length: 30)
Shift.create(user_id: 1, start: "10/23/2019", finish: "13/04/2020", break_length: 15)
Shift.create(user_id: 2, start: "09/23/2019", finish: "12/04/2020", break_length: 45)
Shift.create(user_id: 2, start: "01/23/2019", finish: "09/04/2020", break_length: 30)