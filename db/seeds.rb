# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by(email: 'desafio@exemplo.com')
user.update(
	password: 'DesafioDojo', full_name: 'Desafio'
)

Faker::Config.locale = 'pt-BR'

10.times do |i|
	salary = rand(1400...10000)
	discount = CalculateInss.new(salary).result

	Employee.create(
		name: Faker::Name.name,
		document: Faker::IdNumber.brazilian_id(formatted: true),
		phone_number: Faker::PhoneNumber.cell_phone,
		salary: salary,
		discount_inss: discount,
		address_state: Faker::Address.state,
		address_city: Faker::Address.city,
		address: Faker::Address.street_name
	)
end
