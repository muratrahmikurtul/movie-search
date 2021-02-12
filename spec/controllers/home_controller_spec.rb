require 'rails_helper'

RSpec.describe HomeController do

  describe 'GET #index' do
    it 'return success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST search redirect_to_index" do
    it 'redirects to index with searching param' do
      post :search, params: {q: "superman"}
      expect(response.location).to eq("http://test.host/index?name=superman")
    end
  end
end