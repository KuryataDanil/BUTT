# frozen_string_literal: true

require 'minitest/autorun'

class BookingsControllerTest < Minitest::Test
  setup do
    @user = User.create!(name: "User", email: "user@example.com", password: "password", role: "user")
    @space = Space.create!(name: "Test Space", opening_time: "08:00", closing_time: "20:00", creator: @user)
  end

  test "should create booking with valid parameters" do
    post api_bookings_url, params: { booking: { space_id: @space.id, user_id: @user.id, start_time: DateTime.now, end_time: DateTime.now + 1.hour, status: "confirmed", price: 100.0 } }
    assert_response :created
    assert_equal @space, Booking.last.space
  end

  test "should get bookings for user" do
    Booking.create!(space: @space, user: @user, start_time: DateTime.now, end_time: DateTime.now + 1.hour, status: "confirmed", price: 100.0)
    get api_bookings_url, params: { user_id: @user.id }
    assert_response :success
    assert_equal 1, JSON.parse(@response.body).size
  end
end
