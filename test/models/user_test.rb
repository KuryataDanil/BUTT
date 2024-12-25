# frozen_string_literal: true

require 'minitest/autorun'

class UserTest < Minitest::Test
  test "should not save user without name" do
    user = User.new(email: "test@example.com", password: "password")
    assert_not user.save, "Saved the user without a name"
  end

  test "should not save user without email" do
    user = User.new(name: "Test User", password: "password")
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user with duplicate email" do
    User.create!(name: "Test User", email: "test@example.com", password: "password")
    duplicate_user = User.new(name: "Another User", email: "test@example.com", password: "password")
    assert_not duplicate_user.save, "Saved the user with a duplicate email"
  end

  test "default role should be 'user'" do
    user = User.create!(name: "Test User", email: "test@example.com", password: "password")
    assert_equal "user", user.role, "Default role is not 'user'"
  end
end
