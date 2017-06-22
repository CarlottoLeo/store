require 'rails_helper'

RSpec.describe "Salesmen", type: :request do
  describe "GET /salesmen" do
    it "works! (now write some real specs)" do
      get salesmen_path
      expect(response).to have_http_status(200)
    end
  end
end
