require 'swagger_helper'

RSpec.describe 'Admin::JobApplications', type: :request do
  path '/admin/job_posts/{job_post_id}/job_applications' do
    get 'Retrieves all job applications for a specific job post' do
      tags 'Admin::JobApplications'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :job_post_id, in: :path, type: :string

      response '200', 'job applications found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              job_post_id: { type: :integer },
              created_at: { type: :string, format: 'date-time' },
              updated_at: { type: :string, format: 'date-time' }
            }
          }

        let(:job_post) { create(:job_post) }
        let(:job_post_id) { job_post.id }
        run_test!
      end
    end
  end

  path '/admin/job_posts/{job_post_id}/job_applications/{job_application_id}' do
    get 'Retrieves a job application' do
      tags 'Admin::JobApplications'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :job_post_id, in: :path, type: :string
      parameter name: :job_application_id, in: :path, type: :string

      response '200', 'job application found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            job_post_id: { type: :integer },
            created_at: { type: :string, format: 'date-time' },
            updated_at: { type: :string, format: 'date-time' }
          }

        let(:id) { create(:job_application).id }
        run_test!
      end

      response '404', 'job application not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
