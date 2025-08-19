require 'rails_helper'

RSpec.describe "Routes", type: :request do
  describe "GET /optimize" do
    it "returns http success" do
      get "/routes/optimize"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/routes/show"
      expect(response).to have_http_status(:success)
    end
  end

end
