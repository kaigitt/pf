require 'rails_helper'

RSpec.describe "Admin::Managements", type: :request do
  describe "GET /management" do
    it "returns http success" do
      get "/admin/management/management"
      expect(response).to have_http_status(:success)
    end
  end

end
