require 'rails_helper'

RSpec.describe "Sessions API", type: :request do
  let!(:user) { create(:user, email: "test@example.com", password: "password") }

  describe "POST /login" do
    it "authenticates the user with valid credentials" do
      post "/login", params: { email: "test@example.com", password: "password" }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["message"]).to eq("Login successful")
    end

    it "returns an error for invalid credentials" do
      post "/login", params: { email: "test@example.com", password: "wrong_password" }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
