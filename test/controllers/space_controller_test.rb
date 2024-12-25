# frozen_string_literal: true

require 'minitest/autorun'

class SpaceControllerTest < Minitest::Test
  setup do
    @user = User.create!(name: "Admin", email: "admin@example.com", password: "password", role: "admin")
  end

  test "should get index" do
    Space.create!(name: "Space 1", opening_time: "09:00", closing_time: "18:00", creator: @user)
    get api_spaces_url
    assert_response :success
    assert_equal 1, JSON.parse(@response.body).size
  end

  test "should create space with valid parameters" do
    post api_spaces_url, params: { space: { name: "New Space", opening_time: "08:00", closing_time: "22:00", creator_id: @user.id } }
    assert_response :created
    assert_equal "New Space", Space.last.name
  end
end
