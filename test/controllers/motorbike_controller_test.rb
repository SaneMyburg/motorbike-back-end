require 'test_helper'

class MotorbikeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get motorbike_index_url
    assert_response :success
  end
end
