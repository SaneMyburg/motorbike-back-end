require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'api/v1/motorbikes', type: :request do
  path '/api/v1/motorbikes' do
    get('list motorbikes') do
      produces 'application/json'
      response(200, 'successful') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :text },
                   price: { type: :decimal },
                   photo: { type: :string },
                   finance_fee: { type: :decimal },
                   total_amount_payable: { type: :decimal },
                   duration: {type: :integer}
                 },
                 required: %w[id name description price photo finance_fee total_amount_payable duration]
               }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/motorbikes' do
    post 'Creates a motorbike' do
      consumes 'multipart/form-data'
      parameter name: :motorbike, in: :body, schema: {
        type: :object,
        properties: {
            name: { type: :string },
            description: { type: :text },
            price: { type: :decimal },
            photo: { type: :string },
            finance_fee: { type: :decimal },
            total_amount_payable: { type: :decimal },
            duration: {type: :integer}
            user_id: { type: :bigint }
          },
          required: ['name', 'description', 'price', 'photo', 'finance_fee', 'taotal_amount_payable','duration', 'user_id']
        }


      response '201', 'motorbike created' do
        let(:motorbike) do
          { name: 'New bike', description: 'it is best', price: 200 , photo: 'http/:first', finance_fee: 10,
            total_amount_payable: 300 , user_id: 1 }
        end
        run_test!
      end

      response '422', 'invalid request' do

        let(:motorbike) { { name: 'New bike' } }
        before do
            existing_motorbike = Motorbike.create(name: 'New bike')
          end
        run_test!
      end
    end
  end

  path '/api/v1/motorbikes/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete motorbike') do
      response('204', 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/motorbikes/index' do
    get('index motorbike') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end