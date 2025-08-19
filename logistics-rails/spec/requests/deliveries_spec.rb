require 'rails_helper'

RSpec.describe "Deliveries", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/deliveries/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/deliveries/create"
      expect(response).to have_http_status(:success)
    end
  end

end
