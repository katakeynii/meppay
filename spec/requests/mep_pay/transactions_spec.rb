require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  describe "GET /create" do
    it "returns http success" do
      post "/mep_pay/transactions"
      expect(response).to have_http_status(:success)
    end
  end

end