require 'rails_helper'
require 'swagger_helper'

describe 'Reservations API' do
  path '/api/v1/reservations' do
    get 'Retrieves all reservations' do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'reservations found' do
        run_test!
      end
    end

    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :date },
          city: { type: :string },
          user_id: { type: :integer },
          motorbike_id: { type: :integer },
        },
        required: ['date', 'city', 'user_id', 'motorbike_id']
      }

      response '201', 'reservation created' do
        let(:reservation) { { date: '2023-10-10', city: 'New York', user_id: 1, motorbike_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { date: nil, city: 'New York', user_id: 1, motorbike_id: 1 } }
        run_test!
      end
    end
  end
end
