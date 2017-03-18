require 'rails_helper'

RSpec.describe AplicacionController, type: :controller do

  describe "GET #graphic" do
    it "returns http success" do
      get :graphic
      expect(response).to have_http_status(:success)
    end
  end

end
