require 'rails_helper'

RSpec.describe "Spaces API", type: :request do
  let!(:user) { create(:user) }
  let!(:space) { create(:space, name: "Test Space", creator: user) }

  describe "GET /spaces" do
    it "returns a list of spaces" do
      get "/spaces"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe "POST /spaces" do
    it "creates a new space" do
      post "/spaces", params: {
        space: { name: "New Space", description: "A new space", opening_time: "09:00", closing_time: "18:00", creator_id: user.id }
      }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["space"]["name"]).to eq("New Space")
    end
  end

  describe "PUT /spaces/:id" do
    it "updates a space" do
      put "/spaces/#{space.id}", params: { space: { name: "Updated Space" } }
      expect(response).to have_http_status(:ok)
      expect(space.reload.name).to eq("Updated Space")
    end
  end

  describe "DELETE /spaces/:id" do
    it "deletes a space" do
      delete "/spaces/#{space.id}"
      expect(response).to have_http_status(:ok)
      expect(Space.exists?(space.id)).to be_falsey
    end
  end
end
