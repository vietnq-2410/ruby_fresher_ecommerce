require "rails_helper"

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET #index" do
    let!(:user) { create(:user) }
    it "should response with success status" do
      headers = { "Authorization" => JsonWebToken.encode(user_id: user.id) }
      get "/api/v1/users", headers: headers
      expect(JSON.parse(response.body)["status"]).to eq true
    end

    it "wrong JWT" do
      headers = { "Authorization" => "false" }
      get "/api/v1/users", headers: headers
      expect(JSON.parse(response.body)["status"]).to eq nil
    end
  end
end
