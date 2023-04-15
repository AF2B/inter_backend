require 'faker'

10.times do
  Organization.create(
    name: Faker::Company.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    document: Faker::IDNumber.brazilian_citizen_number(formatted: true),
    cnpj: Faker::Company.brazilian_company_number(formatted: true)
  )
end

10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    password: Faker::Internet.password,
    is_donors: Faker::Boolean.boolean
  )
end

10.times do
  Volunteer.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    skills: Faker::Lorem.paragraph_by_chars(number: 200),
    experience: Faker::Lorem.paragraph_by_chars(number: 200),
    available_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).strftime('%H:%M'),
    location: Faker::Address.full_address
  )
end

10.times do
  Food.create(
    name: Faker::Food.dish,
    category: Faker::Food.description,
    description: Faker::Food.ingredient,
    validity: Faker::Date.forward(days: 30),
    user_id: User.pluck(:id).sample
  )
end

10.times do
  Donation.create(
    quantity: Faker::Number.between(from: 1, to: 100),
    date: Faker::Date.between(from: '2021-01-01', to: '2023-04-14'),
    organization_id: Organization.pluck(:id).sample,
    food_id: Food.pluck(:id).sample
  )
end

10.times do
  Photo.create(
    description: Faker::Lorem.sentence,
    image: Faker::LoremFlickr.image(size: "500x500", search_terms: ['food']),
    donation_id: Donation.pluck(:id).sample
  )
end

10.times do
  Feedback.create(
    user_id: User.pluck(:id).sample,
    comment: Faker::Lorem.paragraph_by_chars(number: 200)
  )
end
