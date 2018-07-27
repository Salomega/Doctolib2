# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
3.times do
  city = City.create(city_name: Faker::WorldCup.city)
end

doctor_list = [
  ["Valerie", "Nakkache", "75015"],
  ["Jacques", "Guez", "75019"],
  ["Gerard", "Cointreau", "75004"],
  ["Paul", "Herman", "75017"],
  ["Anne", "De Kervasdoue", "75003"],
  ["Julien", "Veron", "75011"],
]

doctor_list.each do |first_name, last_name, postal_code, city_id|
	Doctor.create( first_name: first_name, last_name: last_name, postal_code:postal_code, city_id:rand(1..City.last.id))
end


10.times do
  patient = Patient.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, city_id:rand(1..City.last.id))
end

list_specialites = ["Generaliste", "Dentiste", "Otorino"]
list_specialites.each do |spe|
  Specialty.create( specialty_name: spe)
end

15.times do
  spec = DocsAndSpec.create(doctor_id: rand(1..Doctor.last.id) ,  specialty_id:rand(1..Specialty.last.id))
end

20.times do
  id_ville = rand(1..City.last.id)

  docs = Doctor.where(city_id: id_ville)
  if docs.size > 1
    i = rand(0..docs.size-1)
    id_doc = docs[i].id
  end

  clients = Patient.where(city_id: id_ville)
  if clients.size>1
    j = rand(0..clients.size-1)
    id_client = clients[j].id
  end

  appointment = Appointment.create(date: Faker::Date.between(1.year.ago, Date.today) , doctor_id: id_doc , patient_id: id_client, city_id: id_ville)
end

