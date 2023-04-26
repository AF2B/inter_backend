require 'faker'

10.times do
  Ong.create(
    name: Faker::Company.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    password: Faker::Internet.password,
    cnpj: Faker::Company.brazilian_company_number(formatted: true)
  )
end

10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    password: Faker::Internet.password,
  )
end
