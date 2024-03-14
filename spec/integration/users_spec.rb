require 'swagger_helper'

RSpec.describe 'Users', type: :request do
  path '/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            },
            required: %w[email password]
          }
        },
        required: ['user']
      }

      response '201', 'user created' do
        let(:user) { { email: 'user@example.com', password: 'password' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { email: '', password: '' } }
        run_test!
      end
    end
  end

  path '/login' do
    post 'User login' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }

      response '200', 'user logged in' do
        let(:user) { { email: 'user@example.com', password: 'password' } }
        run_test!
      end

      response '401', 'unauthorized' do
        let(:user) { { email: 'invalid@example.com', password: 'invalid' } }
        run_test!
      end
    end
  end
end
