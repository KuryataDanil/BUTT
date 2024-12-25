require 'rails_helper'

RSpec.describe User, type: :model do
  # Дополнительный тест для гарантии уникальности
  describe "email uniqueness validation" do
    before do
      # Создаём пользователя с определенным email
      User.create!(email: "test@example.com", password: "password", name: "Existing User")
    end

    it "should not allow a duplicate email" do
      user = User.new(email: "test@example.com", password: "password", name: "New User")
      expect(user.valid?).to be_falsey
      expect(user.errors[:email]).to include("has already been taken")
    end
  end
end
