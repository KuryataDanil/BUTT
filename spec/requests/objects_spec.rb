require 'rails_helper'

RSpec.describe "Objects API", type: :request do
  let!(:space) { create(:space) }
  let!(:space_object) { create(:space_object, space: space) }

  describe "GET /spaces/:space_id/objects" do
    it "returns objects for a space" do
      get "/spaces/#{space.id}/objects"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe "POST /spaces/:space_id/objects" do
    it "creates a new object in a space" do
      post "/spaces/#{space.id}/objects", params: {
        space_object: { x: 10, y: 10, size_x: 5, size_y: 5, angle: 45 }
      }
      expect(response).to have_http_status(:created)
    end
  end

  describe "POST /objects/delete" do
    it "deletes objects in bulk" do
      post "/objects/delete", params: { ids: [space_object.id] }
      expect(response).to have_http_status(:ok)
      expect(SpaceObject.exists?(space_object.id)).to be_falsey
    end
  end
end
