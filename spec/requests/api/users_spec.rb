require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/users' do
    post('new_session user') do
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }

        },
        required: ['name']
      }

      response '201', 'user created' do
        let(:user) { { name: 'Ali' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'Ali' } }
      
        before do
          existing_user = User.create(name: 'Ali')
        end
      
        run_test!
      end
    end
  end
end
