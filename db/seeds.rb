# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

doctor_list = [
  ["Valerie", "Nakkache", "Otorino", "75015"],
  ["Jacques", "Guez", "Generaliste", "75019"],
  ["Gerard", "Cointreau", "Generaliste", "75004"],
  ["Paul", "Herman", "Otorino", "75017"],
  ["Anne", "De Kervasdoue", "Gyneco", "75003"],
  ["Julien", "Veron", "Dermatologue", "75011"],
  ["Marina", "Valec", "Dermatologue", "75006"],
  ["Maurice", "Daddy", "Dentiste", "75012"],
  ["Felix", "Conolly", "Dentiste", "75015"]
]

doctor_list.each do |first_name, last_name, specialty, postal_code|
	Doctor.create( first_name: first_name, last_name: last_name, specialty:specialty, postal_code:postal_code)
end

require 'faker'
10.times do
  patient = Patient.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name)
end


10.times do
  appointment = Appointment.create(date: Faker::Date.between(1.year.ago, Date.today) , doctor_id: rand(Doctor.last.id) , patient_id: rand(Patient.last.id))
end