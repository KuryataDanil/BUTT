require 'rails_helper'

RSpec.describe "Sessions API", type: :request do
  let!(:user) { create(:user, email: "test@example.com", password: "password") }

  describe "POST /login" do
    let(:user) { create(:user, email: "test@example.com", password: "password") } # Предполагается, что используется FactoryBot для создания пользователей

    it "authenticates the user with valid credentials" do
      post "/login", params: { email: "test@example.com", password: "password" }
      expect(response).to have_http_status(:see_other)
      expect(flash[:notice]).to eq("Добро пожаловать!")
    end

    it "returns an error for invalid credentials" do
      post "/login", params: { email: "testexample.com", password: "wrong_password" }
      expect(response).to have_http_status(:ok)
      expect(flash.now[:alert]).to eq("Неверный email или пароль")
    end
  end
end
