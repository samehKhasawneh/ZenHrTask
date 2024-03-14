require 'rails_helper'

RSpec.describe 'JobApplications', type: :request do
  let(:user) { create(:user) }
  let(:token) { JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base) }
  let(:auth_headers) { { 'Authorization' => "Bearer #{token}" } }

  describe 'GET /users/:user.id/job_applications' do
    it 'returns a successful response' do
      get "/users/#{user.id}/job_applications", headers: auth_headers
      expect(response).to have_http_status(200)
    end
  end
end
