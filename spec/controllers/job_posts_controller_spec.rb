require 'rails_helper'


RSpec.describe JobPostsController, type: :controller do

  let(:user) { create(:user) }
  let(:token) { JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base) }
  let(:auth_headers) { { 'Authorization' => "Bearer #{token}" } }
  
  describe "GET index" do
    it "returns a successful response" do 
      request.headers.merge!(auth_headers)
      get :index
      expect(response).to be_successful
    end
  end
end