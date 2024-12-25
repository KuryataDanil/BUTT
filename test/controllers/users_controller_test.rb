# frozen_string_literal: true

require 'minitest/autorun'

class UsersControllerTest < Minitest::Test
  test "should create user with valid parameters" do
    post api_users_url, params: { user: { name: "Test User", email: "test@example.com", password: "password", role: "user" } }
    assert_response :created
    assert_equal "test@example.com", User.last.email
  end

  test "should not create user with invalid parameters" do
    post api_users_url, params: { user: { name: "", email: "", password: "" } }
    assert_response :unprocessable_entity
  end
end
