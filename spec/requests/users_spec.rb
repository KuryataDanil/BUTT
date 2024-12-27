require 'rails_helper'

RSpec.describe "Users API", type: :request do
  let!(:user) { create(:user) }

  describe "POST /register" do
    it "creates a new user" do
      post "/register", params: { name: "Test User", email: "test@example.com", password: "password" }

      expect(response).to have_http_status(:see_other)
    end

    it "returns an error for invalid data" do
      post "/register", params: { user: { email: "invalid_email" } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT /users/:id/role" do
    it "updates the user role" do
      put "/users/#{user.id}/role", params: { role: "manager" }
      expect(response).to have_http_status(:ok)
      expect(user.reload.role).to eq("manager")
    end
  end
end
