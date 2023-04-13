require 'faker'

50.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    password: Faker::Internet.password
  )
end
