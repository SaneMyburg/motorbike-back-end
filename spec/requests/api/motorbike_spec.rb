require 'rails_helper'
require 'swagger_helper'

describe 'Motorbikes API' do
  path '/api/v1/motorbikes' do
    get 'Retrieves all motorbikes' do
      tags 'Motorbikes'
      produces 'application/json'

      response '200', 'motorbikes found' do
        run_test!
      end
    end

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
          user_id: { type: :integer },
        },
        required: ['name', 'user_id']
      }

      response '201', 'motorbike created' do
        let(:motorbike) { { name: 'Suzuki CB1100', user_id: 1, description: '...', price: 2500, photo: '...', duration: 50, total_amount_payable: 5500, finance_fee: 180 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:motorbike) { { name: 'Suzuki CB1100', user_id: nil } }
        run_test!
      end
    end

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
