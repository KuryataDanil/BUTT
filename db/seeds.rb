# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Создание пользователей
user1 = User.create!(name: "Alice", email: "alice@example.com", password: "password", role: "admin")
user2 = User.create!(name: "Bob", email: "bob@example.com", password: "password", role: "user")

# Создание пространств
space1 = Space.create!(
  name: "Conference Room A",
  description: "Spacious conference room with projector",
  opening_time: "09:00",
  closing_time: "18:00",
  creator: user1
)

space2 = Space.create!(
  name: "Coworking Space",
  description: "Shared working space with fast Wi-Fi",
  opening_time: "08:00",
  closing_time: "22:00",
  creator: user2
)

# Создание объектов
SpaceObject.create!(space: space1, x: 10, y: 20, size_x: 5, size_y: 5, angle: 0)
SpaceObject.create!(space: space1, x: 15, y: 25, size_x: 3, size_y: 3, angle: 45)

# Создание мест (spots)
spot1 = Spot.create!(space: space1, x: 5, y: 5, size: 10, num: 1, price: 50.00, time: 1, time_measure: "hour")
spot2 = Spot.create!(space: space2, x: 10, y: 10, size: 20, num: 2, price: 30.00, time: 1, time_measure: "hour")

# Создание бронирований
booking1 = Booking.create!(
  space: space1,
  user: user2,
  start_time: DateTime.now + 1.day,
  end_time: DateTime.now + 1.day + 2.hours,
  status: "confirmed",
  price: 100.00
)

# Связь между бронированием и местами
SpotsBooking.create!(booking: booking1, spot: spot1)