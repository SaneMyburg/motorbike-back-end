require 'rails_helper'
require 'swagger_helper'

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

    post('create motorbike') do
      consumes 'application/json'
      description 'Create a new motorbike'

      parameter name: :motorbike, in: :body, required: true, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          price: { type: :number, format: :float },
          photo: { type: :string },
          finance_fee: { type: :decimal },
          total_amount_payable: { type: :decimal },
          duration: { type: :integer },
          user_id: { type: :bigint }
        },
        required: %w[name description price photo finance_fee total_amount_payable duration user_id]
      }

      let(:motorbike) { motorbike_params }

      response(201, 'motorbike created') do
        schema(type: :object, properties: {
          id: { type: :bigint },
          name: { type: :string },
          description: { type: :string },
          price: { type: :decimal },
          photo: { type: :string },
          finance_fee: { type: :decimal },
          total_amount_payable: { type: :decimal },
          duration: { type: :integer },
          user_id: { type: :bigint }
        }, required: %w[id name description price photo finance_fee total_amount_payable duration user_id])

        run_test!
      end

      response(422, 'invalid request') do
        schema(type: :object, properties: {
          errors: {
            type: :array,
            items: { type: :string }
          }
        }, required: %w[errors])

        run_test!
      end
    end
  end

  path '/api/v1/motorbikes/{id}' do
    parameter name: :id, in: :path, type: :integer
  
    delete('delete motorbike') do
      produces 'application/json'
      description 'Delete a motorbike by ID'
  
      response(204, 'successful') do
        # Use the `:id` parameter provided by Rswag
        let(:id) { 123 } # Replace with a valid motorbike ID
  
        run_test!
      end
  
      response(404, 'not found') do
        schema(type: :object, properties: {
          error: { type: :string }
        }, required: %w[error])
  
        run_test!
      end
    end
  end
end
