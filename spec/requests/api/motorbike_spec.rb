require 'rails_helper'
require 'swagger_helper'

describe 'Motorbikes API' do
  context 'Retrieve all motorbikes' do
    path '/api/v1/motorbikes' do
      get 'Retrieves all motorbikes' do
        tags 'Motorbikes'
        produces 'application/json'

        response '200', 'motorbikes found' do
          run_test!
        end
      end
    end
  end
end
RSpec.describe 'api/v1/motorbikes', type: :request do
  let(:user) { User.create(name: 'testuser') }

  let(:motorbike_params) do
    {
      name: 'New bike',
      description: 'it is best',
      price: 200.0,
      photo: 'http/:first',
      finance_fee: 10.0,
      total_amount_payable: 300.0,
      duration: 5,
      user_id: user.id
    }
  end

  path '/api/v1/motorbikes' do
    get('list motorbikes') do
      produces 'application/json'
      description 'List all motorbikes'

      response(200, 'successful') do
        schema(type: :array, items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :text },
                   price: { type: :string },
                   photo: { type: :string },
                   finance_fee: { type: :decimal },
                   total_amount_payable: { type: :decimal },
                   duration: { type: :integer },
                   user_id: { type: :bigint }
                 },
                 required: %w[id name description price photo finance_fee total_amount_payable duration user_id]
               })

        run_test!
      end
    end
  end

  context 'Create a motorbike' do
    path '/api/v1/motorbikes' do
      post 'Creates a motorbike' do
        tags 'Motorbikes'
        consumes 'application/json'
        parameter name: :motorbike, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string },
            price: { type: :number },
            photo: { type: :string },
            duration: { type: :integer },
            total_amount_payable: { type: :number },
            finance_fee: { type: :number },
            user_id: { type: :integer }
          },
          required: %w[name user_id]
        }

        response '201', 'motorbike created' do
          let(:motorbike) do
            { name: 'Suzuki CB1100', user_id: 1, description: '...', price: 2500, photo: '...', duration: 50,
              total_amount_payable: 5500, finance_fee: 180 }
          end
          run_test!
        end
      end
    end
  end

  context 'Retrieve a specific motorbike' do
    path '/api/v1/motorbikes/{id}' do
      get 'Retrieves a specific motorbike' do
        tags 'Motorbikes'
        produces 'application/json'
        parameter name: :id, in: :path, type: :integer, description: 'ID of the motorbike'

        response '200', 'motorbike found' do
          let(:id) { create(:motorbike).id }
          run_test!
        end

        response '404', 'motorbike not found' do
          let(:id) { 999 }
          run_test!
        end
      end
    end
  end

  context 'Delete a specific motorbike' do
    path '/api/v1/motorbikes/{id}' do
      delete 'Deletes a specific motorbike' do
        tags 'Motorbikes'
        parameter name: :id, in: :path, type: :integer, description: 'ID of the motorbike'

        response '204', 'motorbike deleted' do
          let(:id) { create(:motorbike).id }
          run_test!
        end

        response '404', 'motorbike not found' do
          let(:id) { 999 }
          run_test!
        end
      end
    end
  end
end
