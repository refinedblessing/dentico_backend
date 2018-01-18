10.times do |i|
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.phone_number,
    sex: Faker::Number.between(0, 1),
    age: Faker::Number.between(1, 100)
  )

  Appointment.create(
    end_time: Faker::Time.forward(i+1, :morning),
    start_time: Faker::Time.forward(i+1, :afternoon),
    user_id: i+1,
    status: Faker::Number.between(0, 2)
  )

  Receipt.create(
    payment_type: Faker::Number.between(0, 2),
    cost: Faker::Number.decimal(3, 2),
    appointment_id: i+1
  )
end
