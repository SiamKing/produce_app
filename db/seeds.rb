10.times do
  User.create(
    name: Faker::Name.first_name,
    email: Faker::Internet.email
    password: Faker::Internet.password
  )
end

10.times do
  Produce.create(
    name: Faker::Food.ingredient
    expires_in: Faker::Number.between(5, 14)
    image: Faker::Placeholdit.image
  )
end
