require 'swagger_helper'

RSpec.describe 'JobPosts', type: :request do
  path '/job_posts/{id}' do
    get 'Retrieves a job post' do
      tags 'JobPosts'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string
      response '200', 'job post found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            description: { type: :string }
          }

        let(:id) { JobPost.create(title: 'title', description: 'description').id }
        run_test!
      end

      response '404', 'job post not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/job_posts' do
    get 'Retrieves all job posts' do
      tags 'JobPosts'
      security [Bearer: {}]
      produces 'application/json'

      response '200', 'job posts found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              title: { type: :string },
              description: { type: :string }
            }
          }

        run_test!
      end
    end

    post 'Creates a job post' do
      tags 'JobPosts'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :job_post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string }
        },
        required: ['title', 'description']
      }

      response '201', 'job post created' do
        let(:job_post) { { title: 'title', description: 'description' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:job_post) { { title: '', description: '' } }
        run_test!
      end
    end
  end

  path '/job_posts/{id}' do
    delete 'Deletes a job post' do
      tags 'JobPosts'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string
      response '204', 'job post deleted' do
        let(:id) { JobPost.create(title: 'title', description: 'description').id }
        run_test!
      end

      response '404', 'job post not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
