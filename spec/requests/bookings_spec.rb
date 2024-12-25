require 'rails_helper'

RSpec.describe "Bookings API", type: :request do
  let!(:user) { create(:user) }
  let!(:space) { create(:space) }
  let!(:booking) { create(:booking, user: user, space: space) }

  describe "GET /bookings" do
    it "returns bookings for a user" do
      get "/bookings", params: { user_id: user.id }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe "POST /bookings" do
    it "creates a new booking" do
      post "/bookings", params: {
        booking: { space_id: space.id, user_id: user.id, start_time: DateTime.now, end_time: DateTime.now + 1.hour, status: "pending", price: 100.00 }
      }
      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /bookings/:id" do
    it "deletes a booking" do
      delete "/bookings/#{booking.id}"
      expect(response).to have_http_status(:ok)
      expect(Booking.exists?(booking.id)).to be_falsey
    end
  end
end
