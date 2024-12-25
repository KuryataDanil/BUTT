# frozen_string_literal: true

require 'minitest/autorun'

class SpaceTest < Minitest::Test
  test "should not save space without name" do
    space = Space.new(opening_time: "09:00", closing_time: "18:00")
    assert_not space.save, "Saved the space without a name"
  end

  test "should not save space without opening and closing times" do
    space = Space.new(name: "Test Space")
    assert_not space.save, "Saved the space without opening and closing times"
  end

  test "should belong to a creator" do
    user = User.create!(name: "Admin", email: "admin@example.com", password: "password")
    space = Space.new(name: "Test Space", opening_time: "09:00", closing_time: "18:00", creator: user)
    assert space.save, "Space did not save with a valid creator"
  end
end
